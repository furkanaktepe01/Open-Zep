pragma solidity ^0.4.24;

import "./ERC721Basic.sol";
import "./ERC721Receiver.sol";
import "../../Math/SafeMath.sol";
import "../../General/AddressUtils.sol";
import "../../Introspection/SupportsInterfaceWithLookup.sol";

contract ERC721BasicToken is SupportsInterfaceWithLookup, ERC721Basic {

    using SafeMath for uint256;
    using AddressUtils for address;

    bytes4 private constant ERC721_RECEIVED = 0x150b7a02;

    mapping(uint256 => address) internal tokenOwner;

    mapping(uint256 => address) internal tokenApprovals;

    mapping(address => uint256) internal ownedTokenCount;

    mapping (address => mapping(address => bool)) internal operatorApprovals;

    constructor() public {

        _registerInterface(InterfaceId_ERC721);
        _registerInterface(InterfaceId_ERC721Exists);
    }

    function balanceOf(address _owner) public view returns (uint256) {

        require(_owner != address(0x0));

        return ownedTokenCount[_owner];
    }

    function ownerOf(uint256 _tokenId) public view returns (address) {

        address owner = tokenOwner[_tokenId];

        require(owner != address(0x0));

        return owner;
    }

    function exists(uint256 _tokenId) public view returns (bool) {

        address owner = tokenOwner[_tokenId];

        return owner != address(0x0);
    }

    function approve(address _to, uint256 _tokenId) public {

        address owner = ownerOf(_tokenId);

        require(_to != owner);

        require(msg.sender == owner || isApprovedForAll(owner, msg.sender));

        tokenApprovals[_tokenId] = _to;

        emit Approval(owner, _to, _tokenId);
    }

    function getApproved(uint256 _tokenId) public view returns (address) {
        
        return tokenApprovals[_tokenId];
    }

    function setApprovalForAll(address _to, bool _approved) public {

        require(_to != msg.sender);

        operatorApprovals[msg.sender][_to] = _approved;

        emit ApprovalForAll(msg.sender, _to, _approved);
    }

    function isApprovedForAll(address _owner, address _operator) public view returns (bool) {

        return operatorApprovals[_owner][_operator];    
    }

    function transferFrom(address _from, address _to, uint256 _tokenId) public {

        require(isApprovedOrOwner(msg.sender, _tokenId));
        
        require(_from != address(0x0));
        
        require(_to != address(0x0));

        clearApproval(_from, _tokenId);

        removeTokenFrom(_from, _tokenId);
        
        addTokenTo(_to, _tokenId);

        emit Transfer(_from, _to, _tokenId);
    }

    function safeTransferFrom(address _from, address _to, uint256 _tokenId) public {

        safeTransferFrom(_from, _to, _tokenId, "");
    }

    function safeTransferFrom(address _from, address _to, uint256 _tokenId, bytes _data) public {

        transferFrom(_from, _to, _tokenId);

        require(checkAndCallSafeTransfer(_from, _to, _tokenId, _data));
    }

    function isApprovedOrOwner(address _spender, uint256 _tokenId) internal view returns (bool) {

        address owner = ownerOf(_tokenId);

        return (
            _spender == owner ||
            getApproved(_tokenId) == _spender ||
            isApprovedForAll(owner, _spender)
        );
    }

    function _mint(address _to, uint256 _tokenId) internal {

        require(_to != address(0x0));

        addTokenTo(_to, _tokenId);

        emit Transfer(address(0x0), _to, _tokenId);
    }

    function _burn(address _owner, uint256 _tokenId) internal {
        
        clearApproval(_owner, _tokenId);

        removeTokenFrom(_owner, _tokenId);

        emit Transfer(_owner, address(0x0), _tokenId);
    }

    function clearApproval(address _owner, uint256 _tokenId) internal {

        require(ownerOf(_tokenId) == _owner);

        if (tokenApprovals[_tokenId] != address(0x0)) {

            tokenApprovals[_tokenId] = address(0x0);
        }
    }

    function addTokenTo(address _to, uint256 _tokenId) internal {

        require(tokenOwner[_tokenId] == address(0x0));

        tokenOwner[_tokenId] = _to;

        ownedTokenCount[_to] = ownedTokenCount[_to].add(1);
    }

    function removeTokenFrom(address _from, uint256 _tokenId) internal {

        require(ownerOf(_tokenId) == _from);

        tokenOwner[_tokenId] = address(0x0);

        ownedTokenCount[_from] = ownedTokenCount[_from].sub(1);
    }

    function checkAndCallSafeTransfer(address _from, address _to, uint256 _tokenId, bytes _data) internal returns (bool) {

        if (!_to.isContract()) {

            return true;
        }

        bytes retval = ERC721Receiver(_to).onERC721Received(msg.sender, _from, _tokenId, _data);

        return (retval == ERC721_RECEIVED);
    }

}
