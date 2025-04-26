// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title VariablesDemo
 * @dev Muestra el uso de variables de estado, locales y globales en Solidity
 */

contract VariablesDemo {
    
    // 🟦 VARIABLE DE ESTADO (se guarda en la blockchain)
    address public propietario;
    uint public ultimoValorGuardado;

    // Constructor: se ejecuta solo una vez al desplegar el contrato
    constructor() {
        propietario = msg.sender; // 🟨 Variable global: dirección que despliega el contrato
    }

    /**
     * @dev Guarda un valor enviado por el usuario
     * @param nuevoValor Un número cualquiera que será guardado
     * @return mensaje Una respuesta con información
     */
    function guardarValor(uint nuevoValor) public returns (string memory mensaje) {
        // 🟩 VARIABLE LOCAL (existe solo mientras se ejecuta la función)
        uint doble = nuevoValor * 2;

        // 🟨 Variable global: dirección del que llama la función
        address quienLlamo = msg.sender;

        // 🟦 Variable de estado: se actualiza y queda guardada en la blockchain
        ultimoValorGuardado = nuevoValor;

        // Podemos usar variables locales para formar un mensaje
        mensaje = string(
            abi.encodePacked(
                "Hola ",
                toAsciiString(quienLlamo),
                ", tu valor fue ",
                uint2str(nuevoValor),
                " y su doble es ",
                uint2str(doble)
            )
        );
    }

    /**
     * @dev Convierte un address a string (para poder mostrarlo)
     */
    function toAsciiString(address x) internal pure returns (string memory) {
        bytes memory s = new bytes(42);
        s[0] = '0';
        s[1] = 'x';
        for (uint i = 0; i < 20; i++) {
            bytes1 b = bytes1(uint8(uint(uint160(x)) / (2**(8*(19 - i)))));
            bytes1 hi = bytes1(uint8(b) / 16);
            bytes1 lo = bytes1(uint8(b) - 16 * uint8(hi));
            s[2+i*2] = char(hi);
            s[3+i*2] = char(lo);            
        }
        return string(s);
    }

    function char(bytes1 b) internal pure returns (bytes1 c) {
        if (uint8(b) < 10) return bytes1(uint8(b) + 0x30);
        else return bytes1(uint8(b) + 0x57);
    }

    /**
     * @dev Convierte un uint a string (usado para mostrar el número)
     */
    function uint2str(uint _i) internal pure returns (string memory str) {
        if (_i == 0) return "0";
        uint j = _i;
        uint len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint k = len;
        j = _i;
        while (j != 0) {
            bstr[--k] = bytes1(uint8(48 + j % 10));
            j /= 10;
        }
        str = string(bstr);
    }
}
