pragma solidity ^0.4.24;

import "./StandardToken.sol";
import "../../Lifecycle/Pausable.sol";

contract PausableToken is StandardToken, Pausable {

    function transfer(address _to, uint256 _value) public whenNotPaused returns (bool) {

        return super.transfer(_to, _value);
    }

    function transferFrom(address _from, address _to, uint256 _value) public whenNotPaused returns (bool) {

        return super.transferFrom(_from, _to, _value);
    }

    function approve(address _spender, uint256 _value) public whenNotPaused returns (bool) {

       return super.approve(_spender, _value);
    }


    function increaseApproval(address _spender, uint256 _addedValue) public whenNotPaused returns (bool) {

        return super.increaseApproval(_spender, _addedValue);
    }

    function decreaseApproval(address _spender, uint256 _subtractedValue) public whenNotPaused returns (bool) {

        return super.decreaseApproval(_spender, _subtractedValue);
    }

}
