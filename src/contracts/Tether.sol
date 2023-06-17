// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;


contract Tether{
    string public name = 'Mock Tether';
    string public symbol = 'USDT';
    uint public totalSupllied = 1000000000000000000000000;
    uint public decimal = 18;

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

    mapping(address => uint256) balanceOf;
    mapping(address => mapping(address => uint256))public allowAnce;


    constructor(){
        balanceOf[msg.sender] = totalSupllied;
    }


function transfer(address _to, uint256 _value)public returns(bool succeed){
    // Having enough coin to spend on
    require(balanceOf[msg.sender] >= _value);
    // Subtract of the sender
    balanceOf[msg.sender] -= _value;
    // Add to receiver
    balanceOf[_to] += _value;
    emit Transfer(msg.sender, _to , _value);
    return true;

}


function approve(address _spender, uint256 _value) public returns(bool succeed){
    allowAnce[msg.sender][_spender] = _value;
    emit Approval(msg.sender, _spender, _value);
    return true;
}




function transferFrom(address _from, address _to, uint256 _value) public returns(bool succeed){
    // TransferFrom function refers to third party interactions..
    require(balanceOf[_from] >= _value);
    require(allowAnce[_from][msg.sender] >= _value);
    // Subtract of the sender
    balanceOf[_from] -= _value;
    // Add to receiver
    balanceOf[_to]   += _value;
    allowAnce[msg.sender][_from] -= _value;
    emit Transfer(_from, _to, _value);
    return true;
}
   
}