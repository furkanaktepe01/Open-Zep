pragma solidity ^0.4.24;

import "../Token/ERC721/ERC721BasicToken.sol";

contract ERC721BasicTokenMock is ERC721BasicToken {

    function mint(address _to, uint256 _tokenId) public {

        super._mint(_to, _tokenId);
    }

    function burn(uint256 _tokenId) public {

        super._burn(ownerOf(_tokenId), _tokenId);
    }

}
