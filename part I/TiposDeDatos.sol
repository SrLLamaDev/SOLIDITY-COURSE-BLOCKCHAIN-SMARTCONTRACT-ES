// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TiposDeDatos {
    
    // **1️⃣ Tipos de datos básicos**
    bool public esValido = true; // Booleano (true o false)
    uint public numeroEntero = 100; // Entero sin signo (0 o mayor)
    int public numeroConSigno = -50; // Entero con signo (positivo o negativo)
    address public direccion = 0x1234567890123456789012345678901234567890; // Dirección Ethereum

    // **2️⃣ Tipos de datos avanzados**
    string public texto = "Hola Solidity"; // Cadenas de texto
    bytes32 public hashEjemplo = keccak256(abi.encodePacked("hash")); // Bytes fijos

    // **3️⃣ Tipos de datos complejos**
    uint[] public listaNumeros; // Array dinámico
    mapping(address => uint) public balances; // Mapping (diccionario clave-valor)

    // **4️⃣ Estructuras personalizadas**
    struct Persona {
        string nombre;
        uint edad;
    }
    Persona public personaEjemplo = Persona("Alice", 30);

    // **5️⃣ Enum (Enumeraciones)**
    enum Estado { Pendiente, EnProceso, Completado }
    Estado public estadoActual = Estado.Pendiente;

    // **6️⃣ Funciones de ejemplo**
    
    // Modifica un número entero
    function setNumeroEntero(uint _nuevoNumero) public {
        numeroEntero = _nuevoNumero;
    }

    // Agrega un número al array
    function agregarNumero(uint _numero) public {
        listaNumeros.push(_numero);
    }

    // Asigna balance a una dirección
    function asignarBalance(address _usuario, uint _monto) public {
        balances[_usuario] = _monto;
    }

    // Cambia el estado
    function cambiarEstado(Estado _nuevoEstado) public {
        estadoActual = _nuevoEstado;
    }
}
