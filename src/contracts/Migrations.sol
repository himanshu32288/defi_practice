pragma solidity >=0.5.0;

contract Migrations {
    address owner;
    uint public last_migrated;
    constructor() public{
        owner=msg.sender;
    } 
    modifier restricted(){
        if(msg.sender==owner) _;
    }
    function setCompleted(uint completed) public restricted{
        last_migrated=completed;
    } 
    function upgrade(address new_address) public restricted{
        Migrations upgraded=Migrations(new_address);
        upgraded.setCompleted(last_migrated);
    }
}