pragma solidity ^0.4.21;

import "../../Token/ERC20/ERC20.sol";

contract ERC20TokenMetadata is ERC20 {

    function tokenURI() external view returns (string);

}

contract ERC20WithMetadata is ERC20TokenMetadata {

    string private tokenURI_ = "";

    constructor(string _tokenURI) public {

        tokenURI_ = _tokenURI;
    }

    function tokenURI() external view returns (string) {

        return tokenURI_;
    }

}
