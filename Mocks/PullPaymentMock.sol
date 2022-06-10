pragma solidity ^0.4.24;

import "../Payment/PullPayment.sol";

contract PullPaymentMock is PullPayment {

    constructor() public payable { }

    function callTransfer(address _dest, uint256 _amount) public {

        asyncTransfer(_dest, _amount);
    }

}
