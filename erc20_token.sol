//SPDX-License-Identifier: MIT
pragma solidity ^0.8.6; // Langauge version for Complier 

contract Token{
    // code for smartcontact
    string public name ;
    string public symbol;
    uint256 public decimals;
    uint256 public totalsupply;
    
    mapping(address => uint256) public balanceOf; // shows balance of token on this account in public e.g. etherscan.io 
    
    event Transfer(address indexed from, address indexed to, uint256 value); // aufruf der fnkt transfer 
    
    
    
    constructor(string memory _name, string memory _symbol, uint256 _decimals, uint256 _totalsupply){
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalsupply = _totalsupply;
        balanceOf[msg.sender] = totalsupply; // pasing all tokens to deploier  of contract  
        //msg.sender is a global var 
        
        
    }
    // function for dynamic var 
    
    function transfer(address _to, uint256 _vavlue) external returns (bool success) {
        
        require(balanceOf[msg.sender] >= _vavlue);
        balanceOf[msg.sender] = balanceOf[msg.sender] - (_vavlue); // take balance of sender 
        balanceOf[_to] = balanceOf[_to] + (_vavlue); // recieve tokens from sender 
        emit Transfer(msg.sender, _to, _vavlue); // sending tokens event. hier wird event und nicht fnkt aufgerufen. keine schleife
        return true;
    }
    
    // basic tranfer function 
    
}
