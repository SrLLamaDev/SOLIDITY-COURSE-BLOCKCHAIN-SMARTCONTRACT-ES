// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
/**
 * Son variables temporales usadas dentro de funciones
 * Existen mientras se ejecuta la función
 * 
 */
contract VarLocal {
    
    function sumar(uint a, uint b) public pure returns (uint) {
        uint resultado = a + b; // Variable local
        return resultado;
    }

}
