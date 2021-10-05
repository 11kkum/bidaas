//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../token/ERC20/IERC20.sol";
import "../security/ReentrancyGuard.sol";
import "../utils/math/SafeMath.sol";

contract MyTokenICO is ReentrancyGuard {
  using SafeMath for uint256;

  uint256 private _rate;
  address payable private _MOCOwner;
  IERC20 private _token;
  uint256 private _weiRaised;
  string public pass;

  constructor(uint256 tmp_rate, address payable owner, IERC20 tmp_token) {
    require(tmp_rate > 0, "Crowdsale: rate is 0");
    require(
      owner != address(0),
      "Crowdsale: wallet is the zero address"
    );
    require(
      address(tmp_token) != address(0),
      "Crowdsale: token is the zero address"
    );
    _rate = tmp_rate;
    _MOCOwner = owner;
    _token = tmp_token;
  }
  event TokenPurchased(address beneficiary, uint256 value, uint256 amount);

  receive() external payable {
    buyMOC(msg.sender);
  }

  function token() public view returns(IERC20){
    return _token;
  }

  function MOCOwner() public view returns(address payable) {
    return _MOCOwner;
  }

  function rate() public view returns (uint256){
    return _rate;
  }

  function passSet(string memory passTemp) public returns(string memory){
    pass = passTemp;
    return pass;
  }

// function getHash(bytes memory password) public pure returns (bytes32) {
//  return keccak256(password);
//}

  function hash(string memory _text) public pure returns (bytes32) {
    return keccak256(abi.encodePacked(_text));
}

  function buyMOC(address beneficiary) public payable nonReentrant {
    uint256 weiAmount = msg.value;
    require(
      beneficiary != address(0),
      "Crowdsale: beneficiary is the zero address"
    );
    require(weiAmount != 0,"Crowdsale: weiAmount is 0");

    //購入するトークン量を計算
    uint256 tokens = _getTokenAmount(weiAmount);
    _weiRaised = _weiRaised.add(weiAmount);

    _token.transferFrom(_MOCOwner, msg.sender, tokens, pass);
    _forwardFunds();
    emit TokenPurchased(beneficiary, weiAmount, tokens);
  }

  function _getTokenAmount(uint256 weiAmount)
    internal
    view
    returns(uint256)
    {
      return weiAmount.mul(_rate);
    }
  

  function _deliverTokens(address beneficiary, uint256 tokenAmount) internal {
    _token.transfer(beneficiary, tokenAmount,pass);
  }

  function _processPurchase(address beneficiary, uint256 tokenAmount)
    internal
  {
    _deliverTokens(beneficiary, tokenAmount);
  }

  function _forwardFunds() internal {
    MOCOwner().transfer(msg.value);
  }
}
