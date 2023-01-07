// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

import {IUpgradableModule} from "./interfaces/IUpgradableModule.sol";
import {Governable} from "./Governable.sol";

contract UpgradableModule is IUpgradableModule, Governable {
	event SubmoduleUpgraded(uint8 submoduleId, address previousImplementation, address newImplementation);

	// maybe not necessary
	address private _supermodule;

	address[] private _submodules;

	constructor(address _governor, address supermodule_, address[] memory submodules_) Governable(_governor) {
		_supermodule = supermodule_;
		_submodules = submodules_;
	}

	function supermodule() external view returns (address) {
		return _supermodule;
	}

	function submodulesAmount(uint8) external view returns (uint256) {
		return _submodules.length;
	}

	function submodule(uint8 id) external view returns (address) {
		return _submodules[id];
	}

	function upgradeSubmodule(uint8 submoduleId, address newImplementation) external onlyGovernor {
		emit SubmoduleUpgraded(submoduleId, _submodules[submoduleId], newImplementation);

		_submodules[submoduleId] = newImplementation;
	}
}
