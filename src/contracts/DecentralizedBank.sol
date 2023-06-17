// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import './RWD.sol';
import './Tether.sol';

contract DecentralizedBank{
    string public name = "decentral Bank";
    address public owner; 
    RWD public rwd;
    Tether public tether;



    constructor(RWD _rwd, Tether _tether)public{
        rwd = _rwd;
        tether = _tether;

    } 
}