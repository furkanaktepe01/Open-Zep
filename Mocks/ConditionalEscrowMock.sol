pragma solidity ^0.4.24;

import "../Payment/ConditionalEscrow.sol";

contract ConditionalEscrowMock is ConditionalEscrow {

    mapping(address => bool) public allowed;

    function setAllowed(address _payee, bool _allowed) public {

        allowed[_payee] = _allowed;
    }

    function withdrawAllowed(address _payee) public view returns (bool) {

        return allowed[_payee];
    }

}
