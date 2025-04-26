// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
/*
* Accesible desde el contrato actual 
    y contratos heredados, pero no desde fuera
* Necesario al usar herencia entre contratos.
*/
contract Padre {
    uint internal dato = 100;
}

contract Hijo is Padre {
    function verDato() public view returns (uint) {
        return dato; // ¡Sí se puede acceder!
    }
}

