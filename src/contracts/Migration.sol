// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;



contract Migration{
    address public owner;
    uint public last_completed_migration;

constructor()public{
     owner = msg.sender;
}


modifier restricted(){
    if(msg.sender == owner)_;
}

function setComponent(uint amount)public view restricted{
    last_completed_migration == amount;
}

function update(address new_address)public view restricted{
    Migration update = Migration(new_address);
    update.setComponent(last_completed_migration);
    
}

}