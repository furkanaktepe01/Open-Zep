pragma solidity ^0.4.24;

import { Bounty, Target } from "../General/Bounty.sol";

contract SecureTargetMock is Target {

    function checkInvariant() public returns (bool) {

        return true;
    }

}

contract SecureTargetBounty is Bounty {

    function deployContract() internal returns (address) {

        return new SecureTargetMock();
    }

}
