// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

interface IGovernable {
	function governor() external view returns (address);
}
