pragma solidity ^0.4.24;

import { MerkleProof } from "../General/MerkleProof.sol";

contract MerkleProofWrapper {

    function verifyProof(bytes32[] _proof, bytes32 _root, bytes32 _leaf) public pure returns (bool) {

        return MerkleProof.verifyProof(_proof, _root, _leaf);
    }

}
