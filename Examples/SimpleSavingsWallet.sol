pragma solidity ^0.4.24;

import "../Ownership/Heritable.sol";

contract SimpleSavingsWallet is Heritable {

    event Sent(address indexed payee, uint256 amount, uint256 balance);
    event Received(address indexed payer, uint256 amount, uint256 balance);

    constructor(uint256 _heartbeatTimeout) Heritable(_heartbeatTimeout) public { }

    function () external payable {

        emit Received(msg.sender, msg.value, address(this).balance);
    }

    function sendTo(address _payee, uint256 _amount) public onlyOwner {

        require(_payee != address(0x0) && _payee != address(this));

        require(_amount > 0);

        _payee.transfer(_amount);

        emit Sent(_payee, _amount, address(this).balance);
    }

}
