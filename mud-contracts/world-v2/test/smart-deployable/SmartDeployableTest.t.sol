// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

import "forge-std/Test.sol";
import { MudTest } from "@latticexyz/world/test/MudTest.t.sol";
import { IBaseWorld } from "@latticexyz/world/src/codegen/interfaces/IBaseWorld.sol";
import { World } from "@latticexyz/world/src/World.sol";
import { getKeysWithValue } from "@latticexyz/world-modules/src/modules/keyswithvalue/getKeysWithValue.sol";
import { FunctionSelectors } from "@latticexyz/world/src/codegen/tables/FunctionSelectors.sol";
import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";
import { State, SmartObjectData } from "../../src/systems/smart-deployable/types.sol";
import { SMART_DEPLOYABLE_DEPLOYMENT_NAMESPACE as DEPLOYMENT_NAMESPACE, LOCATION_DEPLOYMENT_NAMESPACE, STATIC_DATA_DEPLOYMENT_NAMESPACE, EVE_ERC721_PUPPET_DEPLOYMENT_NAMESPACE, ENTITY_RECORD_DEPLOYMENT_NAMESPACE } from "@eveworld/common-constants/src/constants.sol";

import { IWorld } from "../../src/codegen/world/IWorld.sol";
import { State } from "../../src/codegen/common.sol";
import { GlobalDeployableState, DeployableState, DeployableTokenTable } from "../../src/codegen/index.sol";
import { ISmartDeployableSystem } from "../../src/codegen/world/ISmartDeployableSystem.sol";
import { SmartDeployableSystem } from "../../src/systems/smart-deployable/SmartDeployableSystem.sol";
import { GlobalDeployableStateData } from "../../src/codegen/tables/GlobalDeployableState.sol";
import { DeployableState, DeployableStateData } from "../../src/codegen/tables/DeployableState.sol";
import { Location, LocationData } from "../../src/codegen/tables/Location.sol";

import { Utils as SmartDeployableUtils } from "../../src/systems/smart-deployable/Utils.sol";

contract SmartDeployableTest is MudTest {
  IBaseWorld world;
  SmartDeployableSystem smartDeployable;

  using SmartDeployableUtils for bytes14;

  function setUp() public virtual override {
    super.setUp();
    world = IBaseWorld(worldAddress);
  }

  function testWorldExists() public {
    uint256 codeSize;
    address addr = worldAddress;
    assembly {
      codeSize := extcodesize(addr)
    }
    assertTrue(codeSize > 0);
  }

  // test registerDeployable
  function testRegisterDeployable(
    uint256 entityId,
    SmartObjectData memory smartObjectData,
    uint256 fuelUnitVolume,
    uint256 fuelConsumptionPerMinute,
    uint256 fuelMaxCapacity
  ) public {
    vm.assume(entityId != 0);
    vm.assume(fuelUnitVolume != 0);
    vm.assume(fuelConsumptionPerMinute != 0);
    vm.assume(fuelMaxCapacity != 0);
    vm.assume(smartObjectData.owner != address(0));

    ResourceId systemId = SmartDeployableUtils.smartDeployableSystemId();

    world.call(systemId, abi.encodeCall(SmartDeployableSystem.setGlobalResume, ()));

    world.call(
      systemId,
      abi.encodeCall(
        SmartDeployableSystem.registerDeployable,
        (entityId, smartObjectData, fuelUnitVolume, fuelConsumptionPerMinute, fuelMaxCapacity)
      )
    );
  }

  // test anchor
  function testAnchor(
    uint256 entityId,
    SmartObjectData memory smartObjectData,
    uint256 fuelUnitVolume,
    uint256 fuelConsumptionPerMinute,
    uint256 fuelMaxCapacity,
    LocationData memory location
  ) public {}

  // test bringonline
  function testBringOnline(
    uint256 entityId,
    SmartObjectData memory smartObjectData,
    uint256 fuelUnitVolume,
    uint256 fuelConsumptionPerMinute,
    uint256 fuelMaxCapacity,
    LocationData memory location
  ) public {}

  // test bringoffline
  function testBringOffline(
    uint256 entityId,
    SmartObjectData memory smartObjectData,
    uint256 fuelUnitVolume,
    uint256 fuelConsumptionPerMinute,
    uint256 fuelMaxCapacity,
    LocationData memory location
  ) public {}

  // test unanchor
  function testUnanchor(
    uint256 entityId,
    SmartObjectData memory smartObjectData,
    uint256 fuelUnitVolume,
    uint256 fuelConsumptionPerMinute,
    uint256 fuelMaxCapacity,
    LocationData memory location
  ) public {}

  // test destroyDeployable
  function testDestroyDeployable(
    uint256 entityId,
    SmartObjectData memory smartObjectData,
    uint256 fuelUnitVolume,
    uint256 fuelConsumptionPerMinute,
    uint256 fuelMaxCapacity,
    LocationData memory location
  ) public {}

  function testSetGlobalDeployableState(bool isPaused, uint256 lastGlobalOffline, uint256 lastGlobalOnline) public {
    bytes4 functionSelector = ISmartDeployableSystem.eveworld__setGlobalIsPaused.selector;
    ResourceId systemId = FunctionSelectors.getSystemId(functionSelector);

    // ResourceId systemId = SmartDeployableUtils.smartDeployableSystemId();

    world.call(
      systemId,
      abi.encodeCall(SmartDeployableSystem.setGlobalDeployableState, (isPaused, lastGlobalOffline, lastGlobalOnline))
    );

    GlobalDeployableStateData memory globalDeployableState = GlobalDeployableState.get();

    assertEq(isPaused, globalDeployableState.isPaused);
    assertEq(lastGlobalOffline, globalDeployableState.lastGlobalOffline);
    assertEq(lastGlobalOnline, globalDeployableState.lastGlobalOnline);
  }

  function testPauseGlobalState() public {
    bytes4 functionSelector = ISmartDeployableSystem.eveworld__setGlobalIsPaused.selector;

    ResourceId systemId = FunctionSelectors.getSystemId(functionSelector);
    world.call(systemId, abi.encodeCall(SmartDeployableSystem.setGlobalIsPaused, ()));

    GlobalDeployableStateData memory globalDeployableState = GlobalDeployableState.get();

    assertEq(false, globalDeployableState.isPaused);
  }

  function testResumeGlobalState() public {
    bytes4 functionSelector = ISmartDeployableSystem.eveworld__setGlobalResume.selector;

    ResourceId systemId = FunctionSelectors.getSystemId(functionSelector);
    world.call(systemId, abi.encodeCall(SmartDeployableSystem.setGlobalResume, ()));

    GlobalDeployableStateData memory globalDeployableState = GlobalDeployableState.get();

    assertEq(true, globalDeployableState.isPaused);
  }

  function testSetLastGlobalOffline(uint256 lastGlobalOffline) public {
    bytes4 functionSelector = ISmartDeployableSystem.eveworld__setLastGlobalOffline.selector;

    ResourceId systemId = FunctionSelectors.getSystemId(functionSelector);
    world.call(systemId, abi.encodeCall(SmartDeployableSystem.setLastGlobalOffline, (lastGlobalOffline)));

    GlobalDeployableStateData memory globalDeployableState = GlobalDeployableState.get();

    assertEq(lastGlobalOffline, globalDeployableState.lastGlobalOffline);
  }

  function testSetLastGlobalOnline(uint256 lastGlobalOnline) public {
    bytes4 functionSelector = ISmartDeployableSystem.eveworld__setLastGlobalOnline.selector;

    ResourceId systemId = FunctionSelectors.getSystemId(functionSelector);
    world.call(systemId, abi.encodeCall(SmartDeployableSystem.setLastGlobalOnline, (lastGlobalOnline)));

    GlobalDeployableStateData memory globalDeployableState = GlobalDeployableState.get();

    assertEq(lastGlobalOnline, globalDeployableState.lastGlobalOnline);
  }
}
