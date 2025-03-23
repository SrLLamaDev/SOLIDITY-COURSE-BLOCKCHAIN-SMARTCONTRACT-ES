// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.28;
//TIPOS DE DATOS
contract Curso {
    //vemos valores boolenos, enteros y direcciones

    //bolean
    bool public isValid = true;
    bool public isInvalid;

    //Integer sin signo
    uint8 public u8 = 10;
    uint public u256 = 500;
    uint public u250 = 300;

    uint public initial;

    //Intenger 
    int8 public i8 = 127;
    int256 public i256 = 98345897453;
    int public i300 = 9845689;

    int public initialInteger;
    //Adress
    //address public myAddress = address(0);
    address public myAddress = 0xd9145CCE52D386f254917e481eB44e9943F39138;
    address public initialAddress;

    //0xd9145CCE52D386f254917e481eB44e9943F39138

}