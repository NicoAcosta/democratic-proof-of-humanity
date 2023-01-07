// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract Governable {
	address public governor;

	constructor(address _governor) {
		governor = _governor;
	}
}
