pragma solidity ^0.4.24;

import "../Token/ERC20/BasicToken.sol";

contract BasicTokenMock is BasicToken {

    constructor(address _initialAccount, uint256 _initialBalance) public {

        balances[_initialAccount] = _initialBalance;

        totalSupply_ = _initialBalance;
    }

}
