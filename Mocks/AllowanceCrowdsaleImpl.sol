pragma solidity ^0.4.24;

import "../Token/ERC20/ERC20.sol";
import "../Crowdsale/Emission/AllowanceCrowdsale.sol";

contract AllowanceCrowdsaleImpl is AllowanceCrowdsale {

    constructor(
        uint256 _rate,
        address _wallet,
        ERC20 _token, 
        address _tokenWallet
    )
        public
        Crowdsale(_rate, _wallet, _token)
        AllowanceCrowdsale(_tokenWallet)
    {
        
    }

}
