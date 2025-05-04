// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;
/*
VARIABLES DE ESTADO
Son variables almacenadas en la blockchain
este tipo de dato se declara fuera de las funciones
*/
contract VarEstado{
    //inicio del contrato o la clase
    uint public contador = 0;   //varaible de estado

    function incrementar() public{
        //incicio de la funcion
        contador = contador + 1;
        //fin de la funcion
    }
    //fin del contrato o la clase
}