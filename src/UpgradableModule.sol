// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

import {IUpgradableModule} from "./interfaces/IUpgradableModule.sol";
import {Governable} from "./Governable.sol";

contract UpgradableModule is IUpgradableModule, Governable {
	event SubmoduleUpgraded(address previousImplementation, address newImplementation);

	constructor(address _governor) Governable(_governor) {}
}
