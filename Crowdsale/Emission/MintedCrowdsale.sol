pragma solidity ^0.4.24;

import "../Crowdsale.sol";
import "../../Token/ERC20/MintableToken.sol";

contract MintedCrowdsale is Crowdsale {

    function _deliverTokens(address _beneficiary, uint256 _tokenAmount) internal {

        require(MintableToken(address(token)).mint(_beneficiary, _tokenAmount));
    }

}
