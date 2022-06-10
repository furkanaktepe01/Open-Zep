pragma solidity ^0.4.24;

import "../Token/ERC20/BasicToken.sol";

contract ERC223ContractInterface {

    function tokenFallback(address _from, uint256 _value, bytes _data) external;

}

contract ERC223TokenMock is BasicToken {

    constructor(address _initialAccount, uint _initialBalance) public {

        balances[_initialAccount] = _initialBalance;

        totalSupply_ = _initialBalance;
    }

    function transferERC223(address _to, uint _value, bytes _data) public returns (bool) {

        transfer(_to, _value);

        bool isContract = false;

        assembly {
            
            isContract := not(iszero(extcodesize(_to)))
        }

        if (isContract) {

            ERC223ContractInterface receiver = ERC223ContractInterface(_to);

            receiver.tokenFallback(msg.sender, _value, _data);
        }

        return true;
    }

}
