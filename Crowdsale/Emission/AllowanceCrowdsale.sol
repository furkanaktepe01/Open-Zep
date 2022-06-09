pragma solidity ^0.4.24;

import "../Crowdsale.sol";
import "../../Token/ERC20/ERC20.sol";
import "../../Token/ERC20/ERC20Basic.sol";
import "../../Token/ERC20/SafeERC20.sol";
import "../../Math/SafeMath.sol";

contract AllowanceCrowdsale is Crowdsale {

    using SafeMath for uint256;
    using SafeERC20 for ERC20;

    address public tokenWallet;

    constructor(address _tokenWallet) public {

        require(_tokenWallet != address(0x0));

        tokenWallet = _tokenWallet;
    }

    function remainingTokens() public view returns (uint256) {
        
        return token.allowance(tokenWallet, this);
    }

    function _deliverTokens(address _beneficiary, uint256 _tokenAmount) internal {

        token.safeTransferFrom(tokenWallet, _beneficiary, _tokenAmount);
    }

}
