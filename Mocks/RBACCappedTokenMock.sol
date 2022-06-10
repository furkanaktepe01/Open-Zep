pragma solidity ^0.4.24;

import "../Token/ERC20/RBACMintableToken.sol";
import "../Token/ERC20/CappedToken.sol";

contract RBACCappedTokenMock is CappedToken, RBACMintableToken {

    constructor(uint256 _cap) CappedToken(_cap) public {
        
    }

}
