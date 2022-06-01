pragma solidity ^0.4.24;

import "./Claimable.sol";

contract DelayedClaimable is Claimable {

    uint256 public end;
    uint256 public start;

    function setLimits(uint256 _start, uint256 _end) public onlyOwner {
    
        require(_start <= _end);    
        end = _end;
        start = _start;
    }

    function claimOwnership() public onlyPendingOwner {

        require((block.number <= end) && (block.number >= start));

        emit OwnershipTransferred(owner, pendingOwner);

        owner = pendingOwner;

        pendingOwner = address(0x0);

        end = 0;
    }

}
