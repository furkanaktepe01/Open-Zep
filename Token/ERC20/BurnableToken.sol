pragma solidity ^0.4.24;

import "./BasicToken.sol";

contract BurnableToken is BasicToken {

    event Burn(address indexed burner, uint256 value);

    function burn(uint256 _value) public {

        _burn(msg.sender, _value);
    }

    function _burn(address _who, uint256 _value) internal {

        require(_value <= balances[_who]);

        balances[_who] = balances[_who].sub(_value);

        emit Burn(_who, _value);

        emit Transfer(_who, address(0x0), _value);
    }

}
