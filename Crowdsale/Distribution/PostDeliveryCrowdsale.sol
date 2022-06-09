pragma solidity ^0.4.24;

import "../../Math/SafeMath.sol";
import "../../Token/ERC20/ERC20.sol";
import "../Validation/TimedCrowdsale.sol";

contract PostDeliveryCrowdsale is TimedCrowdsale {

    using SafeMath for uint256;

    mapping(address => uint256) public balances;

    function withdrawTokens() public {

        require(hasClosed());

        uint256 amount = balances[msg.sender];

        require(amount > 0);

        balances[msg.sender] = 0;

        _deliverTokens(msg.sender, amount);
    }

    function _processPurchase(address _beneficiary, uint256 _tokenAmount) internal {

        balances[_beneficiary] = balances[_beneficiary].add(_tokenAmount); 
    }

}
