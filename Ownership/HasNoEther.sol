pragma solidity ^0.4.24;

import "./Ownable.sol";

contract HasNoEther is Ownable {

    constructor() public payable {

        require(msg.value == 0);
    }

    function () external { }

    function reclaimEther() external onlyOwner {

        owner.transfer(address(this).balance);
    }

}
