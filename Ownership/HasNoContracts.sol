pragma solidity ^0.4.24;

import "./Ownable.sol";

contract HasNoContracts is Ownable {

    function reclaimContract(address _contractAddr) external onlyOwner {

        Ownable contractInst = Ownable(_contractAddr);

        contractInst.transferOwnership(owner);
    }

}
