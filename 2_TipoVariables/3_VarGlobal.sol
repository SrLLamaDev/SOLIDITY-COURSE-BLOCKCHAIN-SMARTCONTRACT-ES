// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
/**
 * Variables especiales proporcionadas por solidity
 * Contienen información sobre la blockchain
 */
contract VarGlobal {
    address public ultimoLlamador;
    uint public ultimoValor;

    function recibir() public payable {
        ultimoLlamador = msg.sender; // variable global
        ultimoValor = msg.value;     // variable global
    }
}
