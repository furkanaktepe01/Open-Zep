pragma solidity ^0.4.24;

import "../Introspection/SupportsInterfaceWithLookup.sol";

contract SupportsInterfaceWithLookupMock is SupportsInterfaceWithLookup {

    function registerInterface(bytes4 _interfaceId) public {

        _registerInterface(_interfaceId);
    }

}
