// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;
/*
VARIABLES LOCALES
-   son variables temporales que son usadas dentro de
    las funciones
-   Estas variables existen mientras se ejecuta la funci[on
*/
contract VarLocal{
    //uint 0, 1, 2, 3 ...
    //int ... -3, -2, -1, 0, 1, 2, 3... 
    function sumar(uint a, uint b) public pure returns (uint){
        //incio
        uint c = 3;
        uint resultado = a + b + c; //variable local
        return resultado;
        //fin
    }
}