pragma solidity ^0.4.24;

import "../Ownership/HasNoEther.sol";

contract HasNoEtherTest is HasNoEther {

    constructor() public payable { }

}
