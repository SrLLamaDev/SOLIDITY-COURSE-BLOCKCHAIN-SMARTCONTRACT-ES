// SPDX-License-Identifier: MIT
pragma solidity 0.8.29;
/*
VARIABLE GLOBAL
- Son variables especiales que nos proporciona el lenguaje de Solidity
- Contienen informaci'on de la blockchain
*/
contract VarGlobal{
    //inicio de contrato
    address public ultimo_llamador;
    uint public ultimoValor;

    function recibir() public payable {
        ultimo_llamador = msg.sender;   //variable global
        ultimoValor = msg.value;        //variable global
    }
    //fin de contrato
}