// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.12;

contract HolaMundo {
    string private usuario;

    function agregarUsuarioSaludar(string memory _usuario) public {
        usuario = _usuario;
    }

    function saludarSolidity() public view returns(string memory){
        string memory saludo_1 = "Hola Mundo";
        string memory saludo_2 = ", Bienvenido al curso de Solidity con ejemplos!";
        //ingresar el nombre del usuario
        string memory saludo = string(abi.encodePacked(saludo_1, usuario, saludo_2));

        return saludo;
    }

}