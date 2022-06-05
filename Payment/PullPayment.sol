pragma solidity ^0.4.23;

import "./Escrow.sol";

contract PullPayment {

    Escrow private escrow;

    constructor() public {

        escrow = new Escrow();
    }

    function withdrawPayments() public {

        address payee = msg.sender;

        escrow.withdraw(payee);
    }

    function payments(address _dest) public view returns (uint256) {

        return escrow.depositsOf(_dest);
    }

    function asyncTransfer(address _dest, uint256 _amount) internal {

        escrow.deposit.value(_amount)(_dest);
    }

}
