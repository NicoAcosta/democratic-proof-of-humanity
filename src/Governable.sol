// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

import {IGovernable} from "./interfaces/IGovernable.sol";

error OnlyGovernor();

contract Governable is IGovernable {
	address private _governor;

	modifier onlyGovernor() {
		if (msg.sender != _governor) revert OnlyGovernor();
		_;
	}

	constructor(address governor_) {
		_governor = governor_;
	}

	function governor() external view returns (address) {
		return _governor;
	}
}
