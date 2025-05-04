// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//import "./ABDKMath64x64.sol"; // Asegúrate de tener esta librería en el mismo directorio

contract CalculadoraBasica {
    //using ABDKMath64x64 for int128;

    // Suma
    function suma(int a, int b) public pure returns(int) {
        return a + b;
    }

    // Resta
    function resta(int a, int b) public pure returns(int) {
        return a - b;
    }

    // Multiplicación
    function multiplica(int a, int b) public pure returns(int) {
        return a * b;
    }

    // División segura (enteros)
    function divide(int a, int b) public pure returns(int) {
        require(b != 0, "No se puede dividir entre cero");
        return a / b;
    }

    // División con decimales simulados (fixed-point con 18 decimales)
    function divideConDecimales(int a, int b) public pure returns(int) {
        require(b != 0, "No se puede dividir entre cero");
        int factor = 1e18;
        return (a * factor) / b;
    }

    // División usando la librería ABDKMath64x64
    /*
    function divideABDK(int a, int b) public pure returns(int128) {
        require(b != 0, "No se puede dividir entre cero");
        int128 x = ABDKMath64x64.fromInt(a);
        int128 y = ABDKMath64x64.fromInt(b);
        return x.div(y); // Devuelve un número en formato 64.64
    }
    */
}
