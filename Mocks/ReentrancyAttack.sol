pragma solidity ^0.4.24;

contract ReentrancyAttack {

    function callSender(bytes4 _data) public {

        require(msg.sender.call(abi.encodeWithSelector(_data)));
    }

}
