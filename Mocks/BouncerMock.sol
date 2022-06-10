pragma solidity ^0.4.24;

import "../Access/SignatureBouncer.sol";

contract SignatureBouncerMock is SignatureBouncer {

    function checkValidSignature(address _address, bytes _sig) public view returns (bool) {

        return isValidSignature(_address, _sig);
    }

    function onlyWithValidSignature(bytes _sig) public view onlyValidSignature(_sig) {

    }

    function checkValidSignatureAndMethod(address _address, bytes _sig) public view returns (bool) {

        return isValidSignatureAndMethod(_address, _sig);
    }

    function onlyWithValidSignatureAndMethod(bytes _sig) public view onlyValidSignatureAndMethod(_sig) {

    }

    function checkValidSignatureAndData(address _address, bytes, uint, bytes _sig) public view returns (bool) {

        return isValidSignatureAndData(_address, _sig);
    }

    function onlyWithValidSignatureAndData(uint, bytes _sig) public view onlyValidSignatureAndData(_sig) {

    } 

    function theWrongMethod(bytes) public pure {

    }

}
