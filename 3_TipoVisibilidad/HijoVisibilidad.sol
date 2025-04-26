// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./PadreVisibilidad.sol"; // Para Remix, colocar ambos contratos en un solo archivo

contract HijoVisibilidad is PadreVisibilidad {

    function accederDesdeHijo() public view returns (
        string memory,
        string memory
    ) {
        //string memory privado = soloPadre(); // NO se puede acceder a funciones privadas

        string memory interno = funcionCompartida();  // Sí se puede acceder
        string memory publico = funcionPublica();        // También

        return (interno, publico);
    }
}
