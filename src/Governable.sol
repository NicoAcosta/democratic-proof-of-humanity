// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

error OnlyGovernor();

contract Governable {
	address public governor;

	modifier onlyGovernor() {
		if (msg.sender != governor) revert OnlyGovernor();
		_;
	}

	constructor(address _governor) {
		governor = _governor;
	}
}
