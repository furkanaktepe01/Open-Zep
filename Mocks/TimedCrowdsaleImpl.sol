pragma solidity ^0.4.24;

import "../Token/ERC20/ERC20.sol";
import "../Crowdsale/Validation/TimedCrowdsale.sol";


contract TimedCrowdsaleImpl is TimedCrowdsale {

    constructor(
        uint256 _openingTime,
        uint256 _closingTime,
        uint256 _rate,
        address _wallet, 
        ERC20 _token
    )
        public
        Crowdsale(_rate, _wallet, _token)
        TimedCrowsale(_openingTime, _closingTime) {

    }

}
