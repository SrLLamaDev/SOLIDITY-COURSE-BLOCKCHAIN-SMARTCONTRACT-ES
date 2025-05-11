// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BancoSimple {
    //mapping??
    //parecida a un diccionario
    //sirve para asociar claves con valores
    //address para direcciones Ejemplo: 0xF507Baf56754091Fc700d3cac895F005AF446fF4
    //uint256 = uint Esto para valores positivos desde el 0 en adelante
    //private --- para datos privados
    mapping(address => uint256) private balances;

    //Evento para registrar los dep[ositos
    //event Sirve para registrar acciones importantes
    //      no cambia el estado del contrato
    //      se puede ver en el historial de transacciones
    //indexed Se usa en los eventos para que los valores
    //      puedan ser filtrados en los log
    //      solo se puede indexar hasta tres parametros
    //amount no es palabra reservada, pero cuando vean codigo se
    //      va presentar lo que representaria tokens o dinero
    event Deposito(address indexed user, uint256 amount);

    //Evento para registrar lo retiros
    event Reg(address indexed  user, uint256 amount);

    //Funcion para depositar fondos
    function depositar() external payable {
        require(msg.value > 0, "Debes enviar SpoliaETH");
        balances[msg.sender] = balances[msg.sender] + msg.value;
        //emit ... disparar un evento
        emit Deposito(msg.sender, msg.value);
        //msg.value Es la cantidad de ETH o dinero enviada junto a la transaccion
        
    }
    //Funcion para retirar fondos
    function retirar(uint256 _amount) external {
        //msg.sender
        //direccion del remitente que llama a la funcion
        // y es quien esta interactuando con el contrato inteligente
        require(balances[msg.sender]>= _amount, "Fondos insuficientes");
        balances[msg.sender]=balances[msg.sender]-_amount;
        //transfer es un  metodo que transfiere ETH a una direccion
        payable(msg.sender).transfer(_amount);
        emit Reg(msg.sender, _amount);
    }
    //Consultar Saldo
    function ObtenerSaldo() external view returns (uint256){
        return balances[msg.sender];
    }
}