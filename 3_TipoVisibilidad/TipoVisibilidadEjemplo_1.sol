// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VisibilidadEjemplo {
    string private secreto = "Este es privado";
    string internal interno = "Este es interno";
    string public publico = "Este es publico";

    //  Función privada: solo puede ser usada dentro del contrato
    function _verSecreto() private view returns (string memory) {
        return secreto;
    }

    //  Función interna: puede ser usada dentro del contrato o heredada
    function _verInterno() internal view returns (string memory) {
        return interno;
    }

    //  Función pública: puede ser llamada desde cualquier lugar
    function verPublico() public view returns (string memory) {
        return publico;
    }

    //  Función externa: solo se puede llamar desde fuera del contrato
    function verExterno() external pure returns (string memory) {
        return "Llamada externa exitosa";
    }

    //  Función pública que usa las otras funciones privadas e internas
    function verTodo() public view returns (string memory, string memory, string memory) {
        string memory desdePrivado = _verSecreto();   // ✅ sí se puede usar
        string memory desdeInterno = _verInterno();   // ✅ también se puede
        string memory desdePublico = verPublico();    // ✅ es pública
        return (desdePrivado, desdeInterno, desdePublico);
    }

    // ❌ No podemos llamar a `verExterno()` directamente aquí porque es `external`
    // Si quisiéramos llamarla dentro del contrato: `this.verExterno();` (gasta más gas)
}
