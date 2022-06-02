pragma solidity ^0.4.24;

import "../Ownership/Ownable.sol";
import "../Token/ERC20/ERC20Basic.sol";

contract TokenDestructible is Ownable {

    constructor() public payable { }

    function destroy(address[] _tokens) public onlyOwner {

        for (uint256 i = 0; i < _tokens.length; i++) {

            ERC20Basic token = ERC20Basic(_tokens[i]);

            uint balance = token.balanceOf(this);

            token.transfer(owner, balance);
        }

        selfdestruct(owner);
    }

}
