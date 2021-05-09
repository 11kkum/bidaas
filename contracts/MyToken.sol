//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../token/ERC20/ERC20.sol";

contract MyToken is ERC20{
  string public constant CoinName = "testCoin";
  string public constant Symbol = "TC";
  //100億トークンが初期値
  uint256 constant _initial_supply = 10000000000;

  address private _MakerAddress;

  string private constant pass = "pass";
  mapping (address => uint256) private _balances;
  event Withdraw(address indexed from, address indexed to, uint256 value,string pword);

  constructor() ERC20 (CoinName, Symbol) {
    _MakerAddress = msg.sender;
    _mint(msg.sender, _initial_supply);
  }

  // function withdraw(address sender, address recipient, uint256 amount, string memory pword) public returns(bool){
  //     require(sender != address(0), "ERC20: transfer from the zero address");
  //     require(recipient != address(0), "ERC20: transfer to the zero address");
  //     require(amount > 0);
  //     require(keccak256(abi.encodePacked(pass)) == keccak256(abi.encodePacked(pword)),"Incorrect password");
  //     _balances[sender] = _balances[sender].sub(amount, "ERC20: transfer amount exceeds balance");
  //     _balances[recipient] = _balances[recipient].add(amount);
  //     emit Withdraw(sender, recipient, amount, pword);
  //     return true;
  // }

  function getMakerAddress() public view returns(address){
    return _MakerAddress;
  }
}
