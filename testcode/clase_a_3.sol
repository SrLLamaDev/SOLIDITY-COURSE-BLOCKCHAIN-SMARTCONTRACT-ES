// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.28;
//VARIABLES
contract Variable {

    string public textoEjemplo = "curso Solidity";
    bool public isValid = true;

    function foo() public {
        uint valor = 3000;
        valor = 2000;
        uint timestamp = block.timestamp; //timestamp del bloque
        address sender = msg.sender;
    }
}