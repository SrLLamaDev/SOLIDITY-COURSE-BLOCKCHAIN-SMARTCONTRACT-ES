// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PadreVisibilidad {
    string private secretoPrivado = "Soy privado";
    string internal mensajeInterno = "Soy interno";
    string public mensajePublico = "Soy publico";

    // Función privada
    function soloPadre() private view returns (string memory) {
        return secretoPrivado;
    }

    // Función interna
    function funcionCompartida() internal view returns (string memory) {
        return mensajeInterno;
    }

    // Función pública
    function funcionPublica() public view returns (string memory) {
        return mensajePublico;
    }
}
