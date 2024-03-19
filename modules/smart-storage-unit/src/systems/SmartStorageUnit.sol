// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

import { System } from "@latticexyz/world/src/System.sol";
import { EntityRecordData, SmartObjectData, WorldPosition, InventoryItem } from "./types.sol";
import { ResourceId, WorldResourceIdLib, WorldResourceIdInstance } from "@latticexyz/world/src/WorldResourceId.sol";
import { RESOURCE_SYSTEM, RESOURCE_TABLE } from "@latticexyz/world/src/worldResourceTypes.sol";
import { SMART_STORAGE_MODULE_NAME, SMART_STORAGE_MODULE_NAMESPACE } from "./constants.sol";

contract SmartStorageUnit is System {
  using WorldResourceIdInstance for ResourceId;

  function createAndAnchorSmartStorageUnit(
    uint256 smartObjectId,
    EntityRecordData memory entityRecordData,
    SmartObjectData memory smartObjectData,
    WorldPosition memory worldPosition,
    uint256 storageCapacity,
    uint256 ephemeralStorageCapacity
  ) public {
    //Implement the logic to store the data in different modules: EntityRecord, Deployable, Location and ERC721
  }

  function bringOnline(uint256 smartObjectId) public {
    //Implement the logic to bring the smart storage unit online
  }

  function bringOffline(uint256 smartObjectId) public {
    //Implement the logic to bring the smart storage unit offline
  }

  function unanchor(uint256 smartObjectId) public {
    //Implement the logic to unanchor the smart storage unit
    // Scoop all items from the inventory
  }

  function destroy(uint256 smartObjectId) public {
    //Implement the logic to destroy the smart storage unit
    // Scoop all items from the inventory
  }

  function offlineAll() public {
    //Implement the logic to bring all smart storage units offline
  }

  function depositToInventory(uint256 smartObjectId, InventoryItem[] memory items) public {
    //Implement the logic to deposit items to the inventory
    // Only owner of the smart storage unit can deposit items in the inventory
  }

  function depositToEphemeralInventory(uint256 smartObjectId, InventoryItem[] memory items) public {
    //Implement the logic to deposit items to the inventory
  }

  function withdrawFromInventory(uint256 smartObjectId, InventoryItem[] memory items) public {
    //Implement the logic to withdraw items from the inventory
  }

  function withdrawFromEphemeralInventory(uint256 smartObjectId, InventoryItem[] memory items) public {
    //Implement the logic to withdraw items from the inventory
  }

  function smartStorageUnitSystemId() public pure returns (ResourceId) {
    return
      WorldResourceIdLib.encode({
        typeId: RESOURCE_SYSTEM,
        namespace: SMART_STORAGE_MODULE_NAMESPACE,
        name: SMART_STORAGE_MODULE_NAME
      });
  }
}
