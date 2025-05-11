// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
        PAYABLE / PAGADERA
Nos permite recibir
UTILIDAD: pagos, compras ...
*/
contract ModiFuncPayable {
    //evento para registrar pagos recibidos
    event PagoRecibido(address remitente, uint monto);

    function recibirPago() public payable{
        require(msg.value>0, "Deber enviar algo de activos digitales");
        emit PagoRecibido(msg.sender, msg.value);
    }
    //funcion para consultar el balance
    function verBalance() public view returns (uint){
        return address(this).balance;
    }
}