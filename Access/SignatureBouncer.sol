pragma solidity ^0.4.24;

import "../Ownership/Ownable.sol";
import "../Access/RBAC/RBAC.sol";
import "../General/ECRecovery.sol";

contract SignatureBouncer is Ownable, RBAC {

    using ECRecovery for bytes32;

    string public constant ROLE_BOUNCER = "bouncer";
    uint constant METHOD_ID_SIZE = 4;
    uint constant SIGNATURE_SIZE = 96;

    modifier onlyValidSignature(bytes _sig) {

        require(isValidSignature(msg.sender, _sig));
        _;
    }

    modifier onlyValidSignatureAndMethod(bytes _sig) {

        require(isValidSignatureAndMethod(msg.sender, _sig));
        _;
    }

    modifier onlyValidSignatureAndData(bytes _sig) {

        require(isValidSignatureAndData(msg.sender, _sig));
        _;
    }

    function addBouncer(address _bouncer) public onlyOwner {

        require(_bouncer != address(0x0));

        addRole(_bouncer, ROLE_BOUNCER);
    }

    function removeBouncer(address _bouncer) public onlyOwner {

        require(_bouncer != address(0x0));

        removeRole(_bouncer, ROLE_BOUNCER);
    }

    function isValidSignature(address _address, bytes _sig) internal view returns (bool) {

        return isValidDataHash(
            keccak256(abi.encodePacked(address(this), _address)),
            _sig
        );
    }

    function isValidSignatureAndMethod(address _address, bytes _sig) internal view returns (bool) {

        bytes memory data = new bytes(METHOD_ID_SIZE);

        for (uint i = 0; i < data.length; i++) {

            data[i] = msg.data[i];
        }

        return isValidDataHash(
            keccak256(abi.encodePacked(address(this), _address, data)),
            _sig
        );
    }

    function isValidSignatureAndData(address _address, bytes _sig) internal view returns (bool) {

        require(msg.data.length > SIGNATURE_SIZE);

        bytes memory data = new bytes(msg.data.length - SIGNATURE_SIZE);

        for (uint i = 0; i < data.length; i++) {

            data[i] = msg.data[i];
        }

        return isValidDataHash(
            keccak256(abi.encodePacked(address(this), _address, data)),
            _sig
        );
    }

    function isValidDataHash(bytes32 _hash, bytes _sig) internal view returns (bool) {

        address signer = _hash.toEthSignedMessageHash().recover(_sig);

        return hasRole(signer, ROLE_BOUNCER);
    }

}
