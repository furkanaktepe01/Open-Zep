pragma solidity ^0.4.24;

import "../Payment/PullPayment.sol";
import "../Lifecycle/Destructible.sol";

contract Bounty is PullPayment, Destructible {

    bool public claimed;

    mapping(address => address) public researchers;

    event TargetCreated(address createdAddress);

    function () external payable {

        require(!claimed);
    }

    function createTarget() public returns (Target) {

        Target target = Target(deployedContract());

        researchers[target] = msg.sender;

        emit TargetCreated(target);

        return target;
    }

    function claim(Target _target) public {

        address researcher = researchers[_target];

        require(researcher != address(0x0));

        require(!_target.checkInvariant());

        asyncTransfer(researcher, address(this).balance);

        claim = true;
    }

    function deployedContract() internal returns (address);

}

contract Target {

    function checkInvariant() public returns (bool);

}
