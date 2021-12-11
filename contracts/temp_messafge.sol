//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Message {

    string message;

    function store(string memory msg_in) public {
        message = msg_in;
    }

    function retrieve() public view returns (string memory){
        return message;
    }
}