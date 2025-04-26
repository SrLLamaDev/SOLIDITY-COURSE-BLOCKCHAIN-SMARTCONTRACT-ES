// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BancoSimple {
    address public owner;
    uint public balance;

    constructor() {
        owner = msg.sender;
        balance = 0;
    }

    // PURE: Solo hace cálculos matemáticos
    function sumar(uint a, uint b) public pure returns (uint) {
        return a + b;
    }

    // VIEW: Solo lee datos del contrato
    function verBalance() public view returns (uint) {
        return balance;
    }

    // PAYABLE: Permite recibir Ether
    function depositar() public payable {
        balance += msg.value;
    }

    // Función para que el owner retire fondos
    function retirar(uint cantidad) public {
        require(msg.sender == owner, "No eres el dueno");
        require(cantidad <= balance, "Fondos insuficientes");

        balance -= cantidad;
        payable(owner).transfer(cantidad);
    }
}
