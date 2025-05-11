// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
/*
    TIPO DE VISIBILIDAD EXTERNAL / EXTERNO / AFUERA
-Solo puede ser llamada desde:
    otras funciones
    wallets
    interfaces
No puede ser llamada como una funcion normal
    solo usando this.nombreFuncion()

Utilidad:
    las funciones para llamar desde fuera
*/

contract TipoVisibilidadExternal {
    function saludar() external pure returns (string memory){
        return "hola";
    }
}


