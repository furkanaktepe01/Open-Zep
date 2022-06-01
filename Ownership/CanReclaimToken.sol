pragma solidity ^0.4.24;

import "./Ownable.sol";
import "../Token/ERC20/ERC20Basic.sol";
import "../Token/ERC20/SafeERC20.sol";

contract CanReclaimToken is Ownable {

    using SafeERC20 for ERC20Basic;

    function reclaimToken(ERC20Basic _token) external onlyOwner {

        uint balance = _token.balanceOf(this);

        _token.safeTransfer(owner, balance);
    }

}
