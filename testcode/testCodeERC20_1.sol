// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";

contract MyToken is ERC20, Ownable, Pausable {
    uint256 public maxSupply;

    constructor(uint256 _initialSupply, uint256 _maxSupply) ERC20("MyToken", "MTK") {
        require(_initialSupply <= _maxSupply, "Initial supply exceeds max supply");
        _mint(msg.sender, _initialSupply * 10 ** decimals());
        maxSupply = _maxSupply * 10 ** decimals();
    }

    // Función para pausar todas las transacciones
    function pause() external onlyOwner {
        _pause();
    }

    // Función para reanudar todas las transacciones
    function unpause() external onlyOwner {
        _unpause();
    }

    // Función para quemar tokens y reducir la oferta total
    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    // Hook que evita transferencias cuando el contrato está pausado
    function _beforeTokenTransfer(address from, address to, uint256 amount) internal override whenNotPaused {
        super._beforeTokenTransfer(from, to, amount);
    }

    // Función para mintear nuevos tokens (solo el dueño puede hacerlo)
    function mint(address to, uint256 amount) external onlyOwner {
        require(totalSupply() + amount <= maxSupply, "Max supply exceeded");
        _mint(to, amount);
    }
}
