pragma solidity ^0.4.24;

import "../Token/ERC20/ERC20.sol";
import "../Crowdsale/Validation/CappedCrowdsale.sol";

contract CappedCrowdsaleImpl is CappedCrowdsale {

    constructor(uint256 _rate, address _wallet, ERC20 _token, uint256 _cap) public Crowdsale(_rate, _wallet, _token) CappedCrowdsale(_cap) {

    }

}
