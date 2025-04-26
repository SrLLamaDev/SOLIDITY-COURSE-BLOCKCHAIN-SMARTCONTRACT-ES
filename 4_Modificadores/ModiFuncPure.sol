// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
/*
Una función pure solo trabaja con los parámetros que recibe 
y puede hacer cálculos, pero no puede leer ni escribir en el almacenamiento del contrato.
Puede usarla en el constructor para almacenar datos que pueden ser calculados.
*/
contract ModiFuncPure {
    function sumar(uint a, uint b) public pure returns (uint) {
        return a + b;
    }
}
