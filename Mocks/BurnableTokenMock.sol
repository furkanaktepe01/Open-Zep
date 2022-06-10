pragma solidity ^0.4.24;

import "../Token/ERC20/BurnableToken.sol";

contract BurnableTokenMock is BurnableToken {

    constructor(address _initialAccount, uint _initialBalance) public {

        balances[_initialAccount] = _initialBalance;

        totalSupply_ = _initialBalance;
    }

}
