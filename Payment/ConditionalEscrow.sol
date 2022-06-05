pragma solidity ^0.4.23;

import "./Escrow.sol";

contract ConditionalEscrow is Escrow {

    function withdrawalAllowed(address _payee) public view returns (bool);

    function withdraw(address _payee) public {

        require(withdrawalAllowed(_payee));

        super.withdraw(_payee);
    }

}
