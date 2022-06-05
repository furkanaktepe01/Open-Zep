pragma solidity ^0.4.24;

import "../Token/ERC20/StandardToken.sol";

contract SimpleToken is StandardToken {

    string public constant name = "SampleToken";
    string public constant symbol = "SIM";
    uint8 public constant decimals = 18;

    uint256 public constant INITIAL_SUPPLY = 10000 * (10 * uint256(decimals));

    constructor() public {

        totalSupply_ = INITIAL_SUPPLY;

        balances[msg.sender] = INITIAL_SUPPLY;

        emit Transfer(address(0x0), msg.sender, INITIAL_SUPPLY);
    }

}
