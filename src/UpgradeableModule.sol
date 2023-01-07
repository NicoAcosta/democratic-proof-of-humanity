// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

import {IUpgradeableModule} from "./interfaces/IUpgradeableModule.sol";
import {Governable} from "./Governable.sol";

error InvalidId(uint8 id);

contract UpgradeableModule is IUpgradeableModule, Governable {
	event SubmoduleUpgraded(uint8 submoduleId, address previousImplementation, address newImplementation);

	// maybe not necessary
	address private _supermodule;

	address[] private _submodules;

	constructor(address _governor, address supermodule_, address[] memory submodules_) Governable(_governor) {
		_supermodule = supermodule_;
		_submodules = submodules_;
	}

	function supermodule() public view returns (address) {
		return _supermodule;
	}

	function submodulesAmount(uint8) external view returns (uint256) {
		return _submodules.length;
	}

	function submodule(uint8 id) public view returns (address) {
		address _submodule = __(id);
		if (_submodule == address(0)) revert InvalidId(id);
		return _submodule;
	}

	function upgradeSubmodule(uint8 submoduleId, address newImplementation) external onlyGovernor {
		emit SubmoduleUpgraded(submoduleId, _submodules[submoduleId], newImplementation);

		_submodules[submoduleId] = newImplementation;
	}

	function __(uint8 submoduleId) internal view returns (address) {
		return _submodules[submoduleId];
	}
}
