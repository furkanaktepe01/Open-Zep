pragma solidity ^0.4.24;

import "./HasNoEther.sol";
import "./HasNoTokens.sol";
import "./HasNoContracts.sol";

contract NoOwner is HasNoEther, HasNoTokens, HasNoContracts {
    
}
