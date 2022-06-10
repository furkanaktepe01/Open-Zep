pragma solidity ^0.4.24;

import "../Token/ERC20/ERC20.sol";
import "../Crowdsale/Validation/IndividuallyCappedCrowdsale.sol";

contract IndividuallyCappedCrowdsaleImpl is IndividuallyCappedCrowdsale {

    constructor(
        uint256 _rate, 
        address _wallet, 
        ERC20 _token
    )
        public 
        Crowdsale(_rate, _wallet, _token) {
            
    }

} 
