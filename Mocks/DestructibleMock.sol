pragma solidity ^0.4.24;

import "../Lifecycle/Destructible.sol";

contract DestructibleMock is Destructible {

    function () public payable { }

}
