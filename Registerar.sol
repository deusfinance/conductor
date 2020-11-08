//Be name khoda

pragma solidity ^0.6.12;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/AccessControl.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract Registrar is ERC20, AccessControl{

	bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
	bytes32 public constant BURNER_ROLE = keccak256("BURNER_ROLE");


	byte [] public base;

	constructor(address admin, address AMM, string memory name, string memory symbol) public ERC20(name, symbol) { // set name
		_setupRole(DEFAULT_ADMIN_ROLE, admin);
		_setupRole(MINTER_ROLE, AMM);
		_setupRole(BURNER_ROLE, AMM);
		_mint(AMM, 1e18);
// 		base = _base;  , byte [] memory _base
	}


	function mint(address to, uint256 amount) public {
        require(hasRole(MINTER_ROLE, msg.sender), "Caller is not a minter");
        _mint(to, amount);
    }

	function burn(address from, uint256 amount) public {
        require(hasRole(BURNER_ROLE, msg.sender), "Caller is not a burner");
        _burn(from, amount);
    }

}
//Dar panah khoda