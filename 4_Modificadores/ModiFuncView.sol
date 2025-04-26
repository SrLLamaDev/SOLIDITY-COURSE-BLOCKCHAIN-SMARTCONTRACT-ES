// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
/*
* Puede leer el estado del contrato, pero no lo puede modificar.
* Se usa para consultar datos.
*/
contract ModiFuncView {

    uint public numero = 10;

    function verNumero() public view returns (uint) {
        return numero; // Lee una variable de estado
    }

}
