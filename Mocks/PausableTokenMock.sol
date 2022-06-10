pragma solidity ^0.4.24;

import "../Token/ERC20/PausableToken.sol";

contract PausableTokenMock is PausableToken {

    constructor(address _initialAccount, uint _initialBalance) public {

        balances[_initialAccount] = _initialBalance;
    }

}
