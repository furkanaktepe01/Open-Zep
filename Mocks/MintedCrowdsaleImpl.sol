pragma solidity ^0.4.24;

import ".../Token/ERC20/MintableToken.sol";
import "../Crowdsale/Emission/MintedCrowdsale.sol";

contract MintedCrowdsaleImpl is MintedCrowdsale {

    constructor(
        uint256 _rate,
        address _wallet,
        MintableToken _token
    )
        public
        Crowdsale(_rate, _wallet, _token) {

    }

}
