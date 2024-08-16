// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

/* Autogenerated file. Do not edit manually. */

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { FieldLayout } from "@latticexyz/store/src/FieldLayout.sol";
import { Schema } from "@latticexyz/store/src/Schema.sol";
import { EncodedLengths, EncodedLengthsLib } from "@latticexyz/store/src/EncodedLengths.sol";
import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";

struct FuelData {
  uint256 fuelUnitVolume;
  uint256 fuelConsumptionIntervalInSeconds;
  uint256 fuelMaxCapacity;
  uint256 fuelAmount;
  uint256 lastUpdatedAt;
}

library Fuel {
  // Hex below is the result of `WorldResourceIdLib.encode({ namespace: "eveworld", name: "Fuel", typeId: RESOURCE_TABLE });`
  ResourceId constant _tableId = ResourceId.wrap(0x7462657665776f726c640000000000004675656c000000000000000000000000);

  FieldLayout constant _fieldLayout =
    FieldLayout.wrap(0x00a0050020202020200000000000000000000000000000000000000000000000);

  // Hex-encoded key schema of (uint256)
  Schema constant _keySchema = Schema.wrap(0x002001001f000000000000000000000000000000000000000000000000000000);
  // Hex-encoded value schema of (uint256, uint256, uint256, uint256, uint256)
  Schema constant _valueSchema = Schema.wrap(0x00a005001f1f1f1f1f0000000000000000000000000000000000000000000000);

  /**
   * @notice Get the table's key field names.
   * @return keyNames An array of strings with the names of key fields.
   */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](1);
    keyNames[0] = "entityId";
  }

  /**
   * @notice Get the table's value field names.
   * @return fieldNames An array of strings with the names of value fields.
   */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](5);
    fieldNames[0] = "fuelUnitVolume";
    fieldNames[1] = "fuelConsumptionIntervalInSeconds";
    fieldNames[2] = "fuelMaxCapacity";
    fieldNames[3] = "fuelAmount";
    fieldNames[4] = "lastUpdatedAt";
  }

  /**
   * @notice Register the table with its config.
   */
  function register() internal {
    StoreSwitch.registerTable(_tableId, _fieldLayout, _keySchema, _valueSchema, getKeyNames(), getFieldNames());
  }

  /**
   * @notice Register the table with its config.
   */
  function _register() internal {
    StoreCore.registerTable(_tableId, _fieldLayout, _keySchema, _valueSchema, getKeyNames(), getFieldNames());
  }

  /**
   * @notice Get fuelUnitVolume.
   */
  function getFuelUnitVolume(uint256 entityId) internal view returns (uint256 fuelUnitVolume) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(entityId));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /**
   * @notice Get fuelUnitVolume.
   */
  function _getFuelUnitVolume(uint256 entityId) internal view returns (uint256 fuelUnitVolume) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(entityId));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /**
   * @notice Set fuelUnitVolume.
   */
  function setFuelUnitVolume(uint256 entityId, uint256 fuelUnitVolume) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(entityId));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((fuelUnitVolume)), _fieldLayout);
  }

  /**
   * @notice Set fuelUnitVolume.
   */
  function _setFuelUnitVolume(uint256 entityId, uint256 fuelUnitVolume) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(entityId));

    StoreCore.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((fuelUnitVolume)), _fieldLayout);
  }

  /**
   * @notice Get fuelConsumptionIntervalInSeconds.
   */
  function getFuelConsumptionIntervalInSeconds(
    uint256 entityId
  ) internal view returns (uint256 fuelConsumptionIntervalInSeconds) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(entityId));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /**
   * @notice Get fuelConsumptionIntervalInSeconds.
   */
  function _getFuelConsumptionIntervalInSeconds(
    uint256 entityId
  ) internal view returns (uint256 fuelConsumptionIntervalInSeconds) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(entityId));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /**
   * @notice Set fuelConsumptionIntervalInSeconds.
   */
  function setFuelConsumptionIntervalInSeconds(uint256 entityId, uint256 fuelConsumptionIntervalInSeconds) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(entityId));

    StoreSwitch.setStaticField(
      _tableId,
      _keyTuple,
      1,
      abi.encodePacked((fuelConsumptionIntervalInSeconds)),
      _fieldLayout
    );
  }

  /**
   * @notice Set fuelConsumptionIntervalInSeconds.
   */
  function _setFuelConsumptionIntervalInSeconds(uint256 entityId, uint256 fuelConsumptionIntervalInSeconds) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(entityId));

    StoreCore.setStaticField(
      _tableId,
      _keyTuple,
      1,
      abi.encodePacked((fuelConsumptionIntervalInSeconds)),
      _fieldLayout
    );
  }

  /**
   * @notice Get fuelMaxCapacity.
   */
  function getFuelMaxCapacity(uint256 entityId) internal view returns (uint256 fuelMaxCapacity) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(entityId));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 2, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /**
   * @notice Get fuelMaxCapacity.
   */
  function _getFuelMaxCapacity(uint256 entityId) internal view returns (uint256 fuelMaxCapacity) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(entityId));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 2, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /**
   * @notice Set fuelMaxCapacity.
   */
  function setFuelMaxCapacity(uint256 entityId, uint256 fuelMaxCapacity) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(entityId));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 2, abi.encodePacked((fuelMaxCapacity)), _fieldLayout);
  }

  /**
   * @notice Set fuelMaxCapacity.
   */
  function _setFuelMaxCapacity(uint256 entityId, uint256 fuelMaxCapacity) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(entityId));

    StoreCore.setStaticField(_tableId, _keyTuple, 2, abi.encodePacked((fuelMaxCapacity)), _fieldLayout);
  }

  /**
   * @notice Get fuelAmount.
   */
  function getFuelAmount(uint256 entityId) internal view returns (uint256 fuelAmount) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(entityId));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 3, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /**
   * @notice Get fuelAmount.
   */
  function _getFuelAmount(uint256 entityId) internal view returns (uint256 fuelAmount) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(entityId));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 3, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /**
   * @notice Set fuelAmount.
   */
  function setFuelAmount(uint256 entityId, uint256 fuelAmount) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(entityId));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 3, abi.encodePacked((fuelAmount)), _fieldLayout);
  }

  /**
   * @notice Set fuelAmount.
   */
  function _setFuelAmount(uint256 entityId, uint256 fuelAmount) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(entityId));

    StoreCore.setStaticField(_tableId, _keyTuple, 3, abi.encodePacked((fuelAmount)), _fieldLayout);
  }

  /**
   * @notice Get lastUpdatedAt.
   */
  function getLastUpdatedAt(uint256 entityId) internal view returns (uint256 lastUpdatedAt) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(entityId));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 4, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /**
   * @notice Get lastUpdatedAt.
   */
  function _getLastUpdatedAt(uint256 entityId) internal view returns (uint256 lastUpdatedAt) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(entityId));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 4, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /**
   * @notice Set lastUpdatedAt.
   */
  function setLastUpdatedAt(uint256 entityId, uint256 lastUpdatedAt) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(entityId));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 4, abi.encodePacked((lastUpdatedAt)), _fieldLayout);
  }

  /**
   * @notice Set lastUpdatedAt.
   */
  function _setLastUpdatedAt(uint256 entityId, uint256 lastUpdatedAt) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(entityId));

    StoreCore.setStaticField(_tableId, _keyTuple, 4, abi.encodePacked((lastUpdatedAt)), _fieldLayout);
  }

  /**
   * @notice Get the full data.
   */
  function get(uint256 entityId) internal view returns (FuelData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(entityId));

    (bytes memory _staticData, EncodedLengths _encodedLengths, bytes memory _dynamicData) = StoreSwitch.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Get the full data.
   */
  function _get(uint256 entityId) internal view returns (FuelData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(entityId));

    (bytes memory _staticData, EncodedLengths _encodedLengths, bytes memory _dynamicData) = StoreCore.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function set(
    uint256 entityId,
    uint256 fuelUnitVolume,
    uint256 fuelConsumptionIntervalInSeconds,
    uint256 fuelMaxCapacity,
    uint256 fuelAmount,
    uint256 lastUpdatedAt
  ) internal {
    bytes memory _staticData = encodeStatic(
      fuelUnitVolume,
      fuelConsumptionIntervalInSeconds,
      fuelMaxCapacity,
      fuelAmount,
      lastUpdatedAt
    );

    EncodedLengths _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(entityId));

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function _set(
    uint256 entityId,
    uint256 fuelUnitVolume,
    uint256 fuelConsumptionIntervalInSeconds,
    uint256 fuelMaxCapacity,
    uint256 fuelAmount,
    uint256 lastUpdatedAt
  ) internal {
    bytes memory _staticData = encodeStatic(
      fuelUnitVolume,
      fuelConsumptionIntervalInSeconds,
      fuelMaxCapacity,
      fuelAmount,
      lastUpdatedAt
    );

    EncodedLengths _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(entityId));

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function set(uint256 entityId, FuelData memory _table) internal {
    bytes memory _staticData = encodeStatic(
      _table.fuelUnitVolume,
      _table.fuelConsumptionIntervalInSeconds,
      _table.fuelMaxCapacity,
      _table.fuelAmount,
      _table.lastUpdatedAt
    );

    EncodedLengths _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(entityId));

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function _set(uint256 entityId, FuelData memory _table) internal {
    bytes memory _staticData = encodeStatic(
      _table.fuelUnitVolume,
      _table.fuelConsumptionIntervalInSeconds,
      _table.fuelMaxCapacity,
      _table.fuelAmount,
      _table.lastUpdatedAt
    );

    EncodedLengths _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(entityId));

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Decode the tightly packed blob of static data using this table's field layout.
   */
  function decodeStatic(
    bytes memory _blob
  )
    internal
    pure
    returns (
      uint256 fuelUnitVolume,
      uint256 fuelConsumptionIntervalInSeconds,
      uint256 fuelMaxCapacity,
      uint256 fuelAmount,
      uint256 lastUpdatedAt
    )
  {
    fuelUnitVolume = (uint256(Bytes.getBytes32(_blob, 0)));

    fuelConsumptionIntervalInSeconds = (uint256(Bytes.getBytes32(_blob, 32)));

    fuelMaxCapacity = (uint256(Bytes.getBytes32(_blob, 64)));

    fuelAmount = (uint256(Bytes.getBytes32(_blob, 96)));

    lastUpdatedAt = (uint256(Bytes.getBytes32(_blob, 128)));
  }

  /**
   * @notice Decode the tightly packed blobs using this table's field layout.
   * @param _staticData Tightly packed static fields.
   *
   *
   */
  function decode(
    bytes memory _staticData,
    EncodedLengths,
    bytes memory
  ) internal pure returns (FuelData memory _table) {
    (
      _table.fuelUnitVolume,
      _table.fuelConsumptionIntervalInSeconds,
      _table.fuelMaxCapacity,
      _table.fuelAmount,
      _table.lastUpdatedAt
    ) = decodeStatic(_staticData);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function deleteRecord(uint256 entityId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(entityId));

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function _deleteRecord(uint256 entityId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(entityId));

    StoreCore.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }

  /**
   * @notice Tightly pack static (fixed length) data using this table's schema.
   * @return The static data, encoded into a sequence of bytes.
   */
  function encodeStatic(
    uint256 fuelUnitVolume,
    uint256 fuelConsumptionIntervalInSeconds,
    uint256 fuelMaxCapacity,
    uint256 fuelAmount,
    uint256 lastUpdatedAt
  ) internal pure returns (bytes memory) {
    return
      abi.encodePacked(fuelUnitVolume, fuelConsumptionIntervalInSeconds, fuelMaxCapacity, fuelAmount, lastUpdatedAt);
  }

  /**
   * @notice Encode all of a record's fields.
   * @return The static (fixed length) data, encoded into a sequence of bytes.
   * @return The lengths of the dynamic fields (packed into a single bytes32 value).
   * @return The dynamic (variable length) data, encoded into a sequence of bytes.
   */
  function encode(
    uint256 fuelUnitVolume,
    uint256 fuelConsumptionIntervalInSeconds,
    uint256 fuelMaxCapacity,
    uint256 fuelAmount,
    uint256 lastUpdatedAt
  ) internal pure returns (bytes memory, EncodedLengths, bytes memory) {
    bytes memory _staticData = encodeStatic(
      fuelUnitVolume,
      fuelConsumptionIntervalInSeconds,
      fuelMaxCapacity,
      fuelAmount,
      lastUpdatedAt
    );

    EncodedLengths _encodedLengths;
    bytes memory _dynamicData;

    return (_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Encode keys as a bytes32 array using this table's field layout.
   */
  function encodeKeyTuple(uint256 entityId) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(entityId));

    return _keyTuple;
  }
}
