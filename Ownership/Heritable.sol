pragma solidity ^0.4.24;

import "./Ownable.sol";

contract Heritable is Ownable {

    address private heir_;

    uint256 private heartbeatTimeout_;

    uint256 private timeOfDeath_;

    event HeirChanged(address indexed owner, address indexed newHeir);
    event OwnerHeartbeated(address indexed owner);
    event OwnerProclaimedDead(address indexed owner, address indexed heir, uint256 timeOfDeath);
    event HeirOwnershipClaimed(address indexed previousOwner, address indexed newOwner);

    modifier onlyHeir() {

        require(msg.sender == heir_);
        
        _;
    }

    constructor(uint256 _heartbeatTimeout) public {

        setHeartbeatTimeout(_heartbeatTimeout);
    }

    function setHeir(address _newHeir) public onlyOwner {

        require(_newHeir != owner);

        heartbeat();

        emit HeirChanged(owner, _newHeir);

        heir_ = _newHeir;
    }

    function heir() public view returns (address) {
        
        return heir_;
    }
    
    function heartbeatTimeout() public view returns (uint256) {
        
        return heartbeatTimeout_;
    }

    function timeOfDeath() public view returns (uint256) {
        
        return timeOfDeath_;
    }

    function removeHeir() public onlyOwner {

        heartbeat();

        heir_ = address(0x0);
    }

    function proclaimDeath() public onlyHeir {

        require(ownerLives());

        emit OwnerProclaimedDead(owner, heir_, timeOfDeath_);

        timeOfDeath_ = block.timestamp;
    }

    function heartbeat() public onlyOwner {

        emit OwnerHeartbeated(owner);

        timeOfDeath_ = 0;
    }

    function claimHeirOwnership() public onlyHeir {

        require(!ownerLives());

        require(block.timestamp >= timeOfDeath_ + heartbeatTimeout_);

        emit OwnershipTransferred(owner, heir_);

        emit HeirOwnershipClaimed(owner, heir_);

        owner = heir_;

        timeOfDeath_ = 0;
    }

    function setHeartbeatTimeout(uint256 _newHeartbeatTimeout) internal onlyOwner {

        require(ownerLives());

        heartbeatTimeout_ = _newHeartbeatTimeout; 
    }

    function ownerLives() internal view returns (bool) {

        return timeOfDeath_ == 0;
    }

}
