// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TiposDeDatos {
    
    // **1️ Tipos de datos básicos**
    bool public esValido = true; // Booleano (true o false)
    uint public numeroEntero = 100; // Entero sin signo (0 o mayor)
    //uint === uint256
    int public numeroConSigno = -50; // Entero con signo (positivo o negativo)
    address public direccion = 0x1234567890123456789012345678901234567890; // Dirección Ethereum
    
    //unit8 usa 8 bit de almacenamiento
    //puede almacenar desde 0 hasta 255
    //2^8 = 256 valores posibles y como no acepta negativos => Rango 0 a 255
    // **1️.1️ Tipos de datos básicos**
    //EJEMPLOS
    uint8 public variable = 254;
    //uint8 public variable = 256;
    //uint8 public variable = 1000;
    //uint8 public variable = -1;
    // **1️.2️⃣ Tipos de datos básicos**
    //EJEMPLOS
    //puede almacenar de 2^16 = 65,536 pero como se comienza desde el 0
    //Rango: 0 a 65.535
    uint16 public variable_2 = 65535;
    //uint16 public variable = 256;
    //uint16 public variable = 1000;
    //unit16 public variable

    // **1️.2️⃣ El orden importa** 2^8 = 256
    //uint8 public a = 255; //1byte = 8bits 32 bytes
    //uint256 public b = 100; //32bytes   32 bytes
    //uint8 public c = 2; //1byte = 8bits 32 bytes
    //si importa el orden               0.00015gas
    //cuando es uint8 => 0 hasta 255
    uint256 public a =  23;//byte = 8bits
    uint8 public b = 2; //1 byte = 8bits        //32 bytes
    uint16 public asd = 489; //2bytes = 16bits
    uint16 public asda = 489; //2bytes = 16bits
    //2^8 - 2^16 - 2^32 ... 2^256
    
    uint256 public c = 115792089237316195423570985008687907853269984665640564039457584007913129639935;              //32 bytes
    uint public d = 115792089237316195423570985008687907853269984665640564039457584007913129639935;
    //nota
    //    uint256 = uint
                                    //0.000015gas
    // **2️⃣ Tipos de datos avanzados**
    string public texto = "Hola Solidity"; // Cadenas de texto
    //                                      Cadenas de texto dinamicas
    //                                      Las operaciones con string son costosas
    bytes32 public hashEjemplo = keccak256(abi.encodePacked("hash")); // Bytes fijos
    //Almacena 32 bytes aqui generamos un hash con keccak256
    //Este algoritmo para los hashes de transacciones

    // **3️⃣ Tipos de datos complejos**
    //array
    uint[] public listaNumeros; // Array dinámico
    mapping(address => uint) public balances; // Mapping (diccionario clave-valor)
    
    // **4️⃣ Estructuras personalizadas**
    struct Persona {
        string nombre;
        uint edad;
        string apellido;
    }
    Persona public persona_1 = Persona("Alice", 30, "asd");

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