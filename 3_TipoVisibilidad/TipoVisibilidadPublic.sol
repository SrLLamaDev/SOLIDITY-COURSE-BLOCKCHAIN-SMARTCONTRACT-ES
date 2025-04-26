// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
/** _Public_ Accesible desde cualquier lugar 
* Dentro del mismo contrato 
* Desde contratos heredados 
* Desde contratos externos 
* Desde fuera del contrato (por una wallet, dApp, etc.) 
 */
contract TipoVisPublic {
    
    uint public numero = 10; // Crea automáticamente una función getter

    function obtener() public view returns (uint) {
        return numero;
    }

}
