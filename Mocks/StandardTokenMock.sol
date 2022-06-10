pragma solidity ^0.4.24;

import "../Token/ERC20/StandardToken.sol";

contract StandardTokenMock is StandardToken {

    constructor(address _initialAccount, uint _initialBalance) public {

        balances[_initialAccount] = _initialBalance;

        totalSupply_ = _initialBalance;
    }

}
