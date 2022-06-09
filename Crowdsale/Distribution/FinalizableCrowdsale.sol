pragma solidity ^0.4.24;

import "../../Math/SafeMath.sol";
import "../../Ownership/Ownable.sol";
import "../Validation/TimedCrowdsale.sol";

contract FinalizableCrowdsale is Ownable, TimedCrowdsale {

    using SafeMath for uint256;

    bool public isFinalized = false;

    event Finalized();

    function finalize() public onlyOwner {

        require(!isFinalized);
        
        require(hasClosed());

        finalization();

        emit Finalized();

        isFinalized = true;
    }

    function finalization() internal {

    }
    
}
