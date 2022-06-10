pragma solidity ^0.4.24;

import "../Crowdsale/Price/IncreasingPriceCrowdsale.sol";
import "../Token/ERC20/ERC20.sol";
import "../Math/SafeMath.sol";

contract IncreasingPriceCrowdsaleImpl is IncreasingPriceCrowdsale {

    constructor(
        uint256 _openingTime,
        uint256 _closingTime,
        address _wallet, 
        ERC20 _token, 
        uint256 _initialRate, 
        uint256 _finalRate
    )
        public
        Crowdsale(_initialRate, _wallet, _token)
        TimedCrowsale(_openingTime, _closingTime)
        IncreasingPriceCrowdsale(_initialRate, _finalRate) {

    }

}
