// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// title Ejemplo con funciones setter para modificar variables de estado
/// author Tú
/// notice Este contrato permite cambiar el nombre, edad y dirección privada de una persona

contract Persona {
    string private nombre;
    uint private edad;
    string private direccionPrivada;

    /// notice Constructor para inicializar los datos de la persona
    /// param _nombre Nombre inicial
    /// param _edad Edad inicial
    constructor(string memory _nombre, uint _edad) {
        nombre = _nombre;
        edad = _edad;
        direccionPrivada = "Desconocida";
    }

    /// notice Cambia el nombre de la persona
    /// param _nuevoNombre Nuevo nombre a establecer
    function setNombre(string memory _nuevoNombre) public {
        nombre = _nuevoNombre;
    }

    /// notice Cambia la edad de la persona
    /// param _nuevaEdad Nueva edad a establecer
    function setEdad(uint _nuevaEdad) public {
        edad = _nuevaEdad;
    }

    /// notice Cambia la dirección privada
    /// param _nuevaDireccion Nueva dirección privada a establecer
    function setDireccionPrivada(string memory _nuevaDireccion) public {
        direccionPrivada = _nuevaDireccion;
    }

    /// notice Getter para obtener el nombre actual
    /// return El nombre almacenado
    function getNombre() public view returns (string memory) {
        return nombre;
    }

    /// notice Getter para obtener la edad actual
    /// return La edad almacenada
    function getEdad() public view returns (uint) {
        return edad;
    }

    /// notice Getter para obtener la dirección privada
    /// return La dirección privada almacenada
    function getDireccionPrivada() public view returns (string memory) {
        return direccionPrivada;
    }
}
