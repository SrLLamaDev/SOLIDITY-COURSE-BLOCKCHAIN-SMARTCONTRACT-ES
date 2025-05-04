// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library ABDKMath64x64 {
    int128 private constant MIN_64x64 = -0x80000000000000000000000000000000;
    int128 private constant MAX_64x64 =  0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;

    function fromInt(int256 x) internal pure returns (int128) {
        require(x >= -0x8000000000000000 && x <= 0x7FFFFFFFFFFFFFFF, "int256 out of range");
        return int128(x << 64);
    }

    function toInt(int128 x) internal pure returns (int64) {
        return int64(x >> 64);
    }

    function div(int128 x, int128 y) internal pure returns (int128) {
        require(y != 0, "Division by zero");
        int256 result = (int256(x) << 64) / y;
        require(result >= int256(MIN_64x64) && result <= int256(MAX_64x64), "Overflow");
        return int128(result);
    }
}
