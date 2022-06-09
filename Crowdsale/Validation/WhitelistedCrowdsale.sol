pragma solidity ^0.4.24;

import "../Crowsale.sol";
import "../../Access/Whitelist.sol";

contract WhitelistedCrowdsale is Whitelist, Crowsale {

    function _preValidatePurchase(address _beneficiary, uint256 _weiAmount) internal onlyIfWhitelisted(_beneficiary) {

        super._preValidatePurchase(_beneficiary, _weiAmount);
    }

}
