// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
/**
 * Son variables almacendas permanetes en la BC
 * se declaran fuera de las funciones
 * 
 */
contract VarEstado {
    uint public contador = 0; // Variable de estado

    function incrementar() public {
        contador += 1;
    }
}

