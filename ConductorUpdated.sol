//Be name khoda

pragma solidity ^0.6.12;

import "./Registrar.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/math/SafeMath.sol";

contract Conductor is AccessControl{

	using SafeMath for uint256;

	struct Base{
		string name;
		string symbol;
		bool enable;
	}

	struct Base2{
		string name;
		uint256 ratio;
		bool state;
	}

	mapping (uint256 => Base) bases;

	mapping (string => bool) registrars;

	//store all registrars list


	constructor() public{
		_setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
		bases[0] = Base('Tesla', 'TSLA', true);
		bases[1] = Base('QQQ', 'QQQ', true);
		bases[1] = Base('QQQ', 'QQQ', true);
		bases[1] = Base('QQQ', 'QQQ', true);
		bases[1] = Base('QQQ', 'QQQ', true);
		bases[1] = Base('QQQ', 'QQQ', true);
		bases[1] = Base('QQQ', 'QQQ', true);
		bases[1] = Base('QQQ', 'QQQ', true);
		










	}

	function conduct(uint256 [] memory _bases, bool[] memory state) public {
		string memory name = "DEUS ";
		string memory symbol = "r";
 		Base2 [] memory _base2 = new Base2[](_bases.length);

		if (_bases.length > 1){
			for(uint i=1; i<_bases.length; i++){
				require (_bases[i-1]<_bases[i], 'error1');
			}
		}

		for (uint i=0; i<_bases.length; i++){
			if (state[i]){
				name = string(abi.encodePacked(name, " i" , bases[_bases[i]].name));
				symbol = string(abi.encodePacked(symbol, "i" , bases[_bases[i]].symbol));
				_base2[i] = (Base2(bases[_bases[i]].symbol, 5000, true));
			}else{
				name = string(abi.encodePacked(name, " " , bases[_bases[i]].name));
				symbol = string(abi.encodePacked(symbol, bases[_bases[i]].symbol));
				_base2[i] = (Base2(bases[_bases[i]].symbol, 5000, false));
			}
		}
		require(registrars[symbol] == false, 'error2');
		registrars[symbol] = true;


        Registrar newRegistrar = new Registrar(msg.sender, msg.sender, name, symbol);

	}

}


//Dar panah khoda
