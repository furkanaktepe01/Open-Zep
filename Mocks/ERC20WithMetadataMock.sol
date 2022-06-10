pragma solidity ^0.4.24;

import "../Token/ERC20/StandardToken.sol";
import "../Proposals/ERC1046/TokenMetadata.sol";

contract ERC20WithTokenMetadataMock is StandardToken, ERC20WithMetadata {

    constructor(string _tokenURI) public ERC20WithMetadata(_tokenURI) {
        
    }

}
