// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

/* Autogenerated file. Do not edit manually. */

import { SmartObjectData } from "./../../systems/smart-deployable/types.sol";
import { LocationData } from "./../index.sol";

/**
 * @title ISmartDeployableSystem
 * @author MUD (https://mud.dev) by Lattice (https://lattice.xyz)
 * @dev This interface is automatically generated from the corresponding system contract. Do not edit manually.
 */
interface ISmartDeployableSystem {
  function eveworld__registerDeployableToken(address erc721Address) external;

  function eveworld__registerDeployable(
    uint256 entityId,
    SmartObjectData memory smartObjectData,
    uint256 fuelUnitVolumeInWei,
    uint256 fuelConsumptionIntervalInSeconds,
    uint256 fuelMaxCapacityInWei
  ) external;

  function eveworld__destroyDeployable(uint256 entityId) external;

  function eveworld__bringOnline(uint256 entityId) external;

  function eveworld__bringOffline(uint256 entityId) external;

  function eveworld__anchor(uint256 entityId, LocationData memory locationData) external;

  function eveworld__unanchor(uint256 entityId) external;

  function eveworld__globalPause() external;

  function eveworld__globalResume() external;
}
