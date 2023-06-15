// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract RWD{
    string public name = "Reward Token";
    string public symbol = "RWD";
    uint public totalSupply = 1000000000000000000000000;
    uint public decimal = 18;
    mapping(address => uint) balanceOf;
    mapping(address => mapping(address => uint))allowAnce;

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint _value

    );

    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint _value
    );

    constructor() public{
        balanceOf[msg.sender] = totalSupply;
    }


    function transfer(address _to, uint256 _value)public returns(bool succeed){
        // Abality to transacting
        require(balanceOf[msg.sender] >= _value);
        // Add to receiver
        balanceOf[_to] += _value;
        // subtract the sender
        balanceOf[msg.sender] -= _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) public returns(bool succeed){
        allowAnce[msg.sender][_spender] -= _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }


    function approve(address _from, address _to, uint256 _value)public returns(bool succeed){
        // Abality to transacting
        require(allowAnce[_from][msg.sender] >= _value);
        require(balanceOf[_from] >= _value);
        // Add to receiver
        balanceOf[_to] += _value;
        // subtract the sender
        balanceOf[_from] -= _value;
        allowAnce[msg.sender][_from] -= _value;
        emit Transfer(_from, _to, _value);
        return true;

    }








}
