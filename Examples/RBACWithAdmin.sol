pragma solidity ^0.4.24;

import "../Access/RBAC/RBAC.sol";

contract RBACWithAdmin is RBAC {

    string public constant ROLE_ADMIN = "admin";

    modifier onlyAdmin() {

        checkRole(msg.sender, ROLE_ADMIN);
        _;
    }

    constructor() public {

        addRole(msg.sender, ROLE_ADMIN);
    }

    function adminAddRole(address _addr, string _roleName) public onlyAdmin {

        addRole(_addr, _roleName);
    }

    function adminRemoveRole(address _addr, string _roleName) public onlyAdmin {

        removeRole(_addr, _roleName);
    }

}
