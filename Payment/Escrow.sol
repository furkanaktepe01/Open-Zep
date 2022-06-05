pragma solidity ^0.4.23;

import "../Math/SafeMath.sol";
import "../Ownership/Ownable.sol";

contract Escrow is Ownable {

    using SafeMath for uint256;

    event Deposited(address indexed payee, uint256 weiAmount);
    event Withdrawn(address indexed payee, uint256 weiAmount);

    mapping(address => uint256) private deposits;

    function depositsOf(address _payee) public view returns (uint256) {

        return deposits[_payee];
    }

    function deposit(address _payee) public onlyOwner payable {

        uint256 amount = msg.value;

        deposits[_payee] = deposits[_payee].add(amount);

        emit Deposited(_payee, amount);
    }

    function withdraw(address _payee) public onlyOwner {

        uint256 payment = deposits[_payee];

        assert(address(this).balance >= payment);

        deposits[_payee] = 0;

        _payee.transfer(payment);

        emit Withdrawn(_payee, payment);
    }
    
}
