// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.0;

contract Messenger {
    string private message;
    address private owner1;
    address private owner2;

    constructor(){
        owner1 = msg.sender;
    }

    modifier onlyOwner {
      require(msg.sender == owner1);
      _;
   }

    modifier onlyParticipants {
      require(msg.sender == owner1 || msg.sender == owner2);
      _;
   }

    function sendMessage (string memory _input) public onlyParticipants {
        message = _input;
    }

    function setParticipant(address _owner2) public onlyOwner {
        require (owner1 != _owner2);
        owner2 = _owner2;
    }

    function getMessage() public view onlyParticipants returns (string memory){
        string memory m = message;
        return m;
    }
}