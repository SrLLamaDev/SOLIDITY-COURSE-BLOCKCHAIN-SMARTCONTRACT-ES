// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;
/*
        PUBLIC
Accesible desde cualquier lugar
- dentro del mismo contrato
- desde contratos herados
- desde contratos externos
- desde fuera del contrato por ejmplo wallts, dapp ...
*/
contract TipoVisibilidadPublico {
    uint public numero = 10;    //cuando usamos el public
                                //automaticamente genera una funcion getter
                                //getter = obtener
    function obtenerAAA() public view returns (uint){
        return numero;    
    }

}