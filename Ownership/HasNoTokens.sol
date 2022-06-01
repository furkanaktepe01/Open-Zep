pragma solidity ^0.4.24;

import "./CanReclaimToken.sol";

contract HasNoTokens is CanReclaimToken {

    function tokenFallback(address _from, uint _value, bytes _data) external pure {

        _from;
        _value;
        _data;

        revert();
    }

}
