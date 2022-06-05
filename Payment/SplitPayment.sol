pragma solidity ^0.4.24;

import "../Math/SafeMath.sol";

contract SplitPayment {

    using SafeMath for uint256;

    uint256 public totalShares = 0;
    uint256 public totalReleased = 0;

    mapping(address => uint256) public shares;
    mapping(address => uint256) public released;

    address[] public payees;
 
    constructor(address[] _payees, uint256[] _shares) public payable {

        require(_payees.length == _shares.length);

        for (uint256 i = 0; i < _payees.length; i++) {

            addPayee(_payees[i], _shares[i]);
        }
    }

    function () external payable { }

    function claim() public {

        address payee = msg.sender;

        require(shares[payee] > 0);

        uint256 totalReceived = address(this).balance.add(totalReleased);

        uint256 payment = totalReceived.mul(shares[payee]).div(totalShares).sub(released[payee]);

        require(payment != 0);

        require(address(this).balance >= payment);

        released[payee] = released[payee].add(payment);

        totalReceived = totalReceived.add(payment);

        payee.transfer(payment);
    }

    function addPayee(address _payee, uint256 _shares) internal {

        require(_payee != address(0x0));
        require(_shares > 0);
        require(shares[_payee] == 0);

        payees.push(_payee);

        shares[_payee] = _shares;

        totalShares = totalShares.add(_shares);
    }

}
