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



}
