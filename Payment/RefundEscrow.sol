pragma solidity ^0.4.23;

import "./ConditionalEscrow.sol";
import "../Ownership/Ownable.sol";

contract RefundEscrow is Ownable, ConditionalEscrow {

    enum State { Active, Refunding, Closed };

    event Closed();
    event RefundsEnabled();

    State public state;
    address public beneficiary;

    constructor(address _beneficiary) public {

        require(_beneficiary != address(0x0));

        beneficiary = _beneficiary;

        state = State.Active;
    }

    function deposit(address _refundee) public payable {

        require(state == State.Active);

        super.deposit(_refundee);
    }

    function close() public onlyOwner {

        require(state == State.Active);

        state = State.Closed;

        emit Closed();
    }

    function enableRefunds() public onlyOwner {

        require(state == State.Active);

        state = State.Refunding;

        emit RefundsEnabled();
    }

    function beneficiaryWithdraw() public {

        require(state == State.Closed);

        beneficiary.transfer(address(this).balance);
    }

    function withdrawalAllowed(address _payee) public view returns (bool) {

        return state == State.Refunding;
    }
    
}
