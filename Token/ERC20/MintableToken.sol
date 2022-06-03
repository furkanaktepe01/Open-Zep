pragma solidity ^0.4.24;

import "./StandardToken.sol";
import "../../Ownership/Ownable.sol";

contract MintableToken is StandardToken, Ownable {

    event Mint(address indexed to, uint256 amount);
    event MintFinished();

    bool public mintingFinished = false;

    modifier canMint() {

        require(!mintingFinished);
        _;
    }

    modifier hasMintPermission() {

        require(msg.sender == owner);
        _;
    }

    function mint(address _to, uint256 _amount) public hasMintPermission canMint returns (bool) {

        totalSupply_ = totalSupply_.add(_amount);

        balances[_to] = balances[_to].add(_amount);

        emit Mint(_to, _amount);

        emit Transfer(address(0x0), _to, _amount);

        return true;
    }

    function finishMinting() public onlyOwner canMint returns (bool) {

        mintingFinished = true;

        emit MintFinished();

        return true;
    }

}
