// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
/*
get -- Obtener (leer) un valor.
set -- Establecer (modificar) un valor.
*/
contract Persona {
    string private nombre;

    // SET: función para modificar el valor
    function setNombre(string memory _nombre) public {
        nombre = _nombre;
    }

    // GET: función para leer el valor
    function getNombre() public view returns (string memory) {
        return nombre;
    }
}
/*
--memory: temporal, barata, y rápida.
--storage: permanente, cara, y lenta (se guarda en la blockchain).
--calldata: solo para parámetros de entrada (más eficiente que memory, pero solo lectura).
*/