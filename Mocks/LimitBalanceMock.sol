pragma solidity ^0.4.24;

import "../General/LimitBalance.sol";

contract LimitBalanceMock is LimitBalance(1000) {

    function limitDeposit() public payable limitedPayable {
        
    }

}
