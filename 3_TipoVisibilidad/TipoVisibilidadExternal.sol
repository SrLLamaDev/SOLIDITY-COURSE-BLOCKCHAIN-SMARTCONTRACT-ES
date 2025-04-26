// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
/*
** Solo puede ser llamada desde fuera del contrato 
    (desde otras funciones, wallets, interfaces).
** No puede ser llamada internamente como una función normal,
    solo usando this.nombreFuncion().
** Necesaria para funciones públicas que solo serán llamadas 
    desde fuera.
*/
contract EjemploExternal {
    function saludar() external pure returns (string memory) {
        return "Hola desde fuera";
    }

    // function prueba() public view {
    //     saludar(); ❌ Esto da error
    //     this.saludar(); ✅ Así sí funciona
    // }
}


