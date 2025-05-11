// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// ejemplo básico con getters automáticos y personalizados
/// Tú
/// Este contrato almacena y permite acceder a información de una persona

contract Persona {
    // Variables públicas generan getters automáticamente
    string public nombre;
    uint public edad;

    // Variable privada (no se genera getter automáticamente)
    string private direccionPrivada;

    /// notice Constructor para inicializar el nombre y edad de la persona
    /// param _nombre Nombre de la persona
    /// param _edad Edad de la persona
    constructor(string memory _nombre, uint _edad) {
        nombre = _nombre;
        edad = _edad;
        direccionPrivada = "Calle Secreta 123"; // Solo para ejemplo
    }

    /// notice Establece un nuevo nombre
    /// param _nuevoNombre El nuevo nombre a asignar
    function setNombre(string memory _nuevoNombre) public {
        nombre = _nuevoNombre;
    }

    /// notice Establece una nueva dirección privada
    /// param _direccion La dirección a almacenar (no visible públicamente)
    function setDireccionPrivada(string memory _direccion) public {
        direccionPrivada = _direccion;
    }

    /// Getter personalizado para obtener la dirección privada
    /// dev Útil cuando una variable es privada y se quiere acceso controlado
    /// return La dirección privada almacenada
    function getDireccionPrivada() public view returns (string memory) {
        return direccionPrivada;
    }
}
