// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// title Contrato con getters y setters para datos de una persona
/// author Tú
/// notice Almacena y permite modificar y leer información básica de una persona

contract Persona {
    string private nombre;
    uint private edad;
    string private correo;

    /// notice Constructor para inicializar la persona
    /// param _nombre Nombre inicial
    /// param _edad Edad inicial
    /// param _correo Correo electrónico inicial
    constructor(string memory _nombre, uint _edad, string memory _correo) {
        nombre = _nombre;
        edad = _edad;
        correo = _correo;
    }

    // === SETTERS ===

    /// notice Cambia el nombre de la persona
    /// param _nuevoNombre El nuevo nombre
    function setNombre(string memory _nuevoNombre) public {
        nombre = _nuevoNombre;
    }

    /// notice Cambia la edad de la persona
    /// param _nuevaEdad La nueva edad
    function setEdad(uint _nuevaEdad) public {
        edad = _nuevaEdad;
    }

    /// notice Cambia el correo electrónico
    /// param _nuevoCorreo El nuevo correo electrónico
    function setCorreo(string memory _nuevoCorreo) public {
        correo = _nuevoCorreo;
    }

    // === GETTERS ===

    /// notice Obtiene el nombre actual de la persona
    /// return El nombre almacenado
    function getNombre() public view returns (string memory) {
        return nombre;
    }

    /// notice Obtiene la edad actual de la persona
    /// return La edad almacenada
    function getEdad() public view returns (uint) {
        return edad;
    }

    /// notice Obtiene el correo electrónico actual
    /// return El correo almacenado
    function getCorreo() public view returns (string memory) {
        return correo;
    }
}
