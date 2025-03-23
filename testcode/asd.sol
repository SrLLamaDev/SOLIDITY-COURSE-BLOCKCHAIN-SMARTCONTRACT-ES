// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {
    uint private storedNumber;

    function setNumber(uint _num) public {
        storedNumber = _num;
    }

    function getNumber() public view returns (uint) {
        return storedNumber;
    }
}