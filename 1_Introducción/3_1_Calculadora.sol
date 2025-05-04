// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CalculadoraBasica {
    //uint => 0 hacia adelante
    function suma(int a, int b) public pure returns(int){
        return a + b;
    }
    
    function resta(int a, int b) public pure returns(int){
        return a - b;
    }

    function multiplica(int a, int b) public pure returns(int){
        return a * b;
    }

    function divide(int a, int b) public pure returns(int){
        return a / b;
    }
}