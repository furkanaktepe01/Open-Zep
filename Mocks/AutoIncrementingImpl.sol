pragma solidity ^0.4.24;

import "../General/AutoIncrementing.sol";

contract AutoIncrementingImpl {

    using AutoIncrementing for AutoIncrementing.Counter;

    uint256 public theId;

    mapping(string => AutoIncrementing.Counter) private counters;

    function doThing(string _key) public returns (uint256) {

        theId = counters[_key].nextId();

        return theId;
    }

}
