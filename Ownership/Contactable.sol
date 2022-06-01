pragma solidity ^0.4.24;

import "./Ownable.sol";

contract Contactable is Ownable {

    string public contactInformation;

    function setContactInformation(string _info) public onlyOwner {

        contactInformation = _info;
    }

}
