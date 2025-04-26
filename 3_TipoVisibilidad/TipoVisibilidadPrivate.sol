// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
/*
* Solo accesible dentro del contrato donde se define.
* No se puede acceder ni siquiera desde contratos que heredan este contrato.
* Útil para datos que no deberían ser visibles o manipulables externamente.
*/
contract TipoVisPrivate {

    uint private secreto = 42;

    function obtener() public view returns (uint) {
        return secreto; // Solo aquí se puede acceder
    }
}

