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

struct GlobalDeployableStateData {
  bool isPaused;
  uint256 lastGlobalOffline;
  uint256 lastGlobalOnline;
}

library GlobalDeployableState {
  // Hex below is the result of `WorldResourceIdLib.encode({ namespace: "eveworld", name: "GlobalDeployable", typeId: RESOURCE_TABLE });`
  ResourceId constant _tableId = ResourceId.wrap(0x7462657665776f726c64000000000000476c6f62616c4465706c6f7961626c65);

  FieldLayout constant _fieldLayout =
    FieldLayout.wrap(0x0041030001202000000000000000000000000000000000000000000000000000);

  // Hex-encoded key schema of (uint256)
  Schema constant _keySchema = Schema.wrap(0x002001001f000000000000000000000000000000000000000000000000000000);
  // Hex-encoded value schema of (bool, uint256, uint256)
  Schema constant _valueSchema = Schema.wrap(0x00410300601f1f00000000000000000000000000000000000000000000000000);

  /**
   * @notice Get the table's key field names.
   * @return keyNames An array of strings with the names of key fields.
   */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](1);
    keyNames[0] = "updatedBlockNumber";
  }

  /**
   * @notice Get the table's value field names.
   * @return fieldNames An array of strings with the names of value fields.
   */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](3);
    fieldNames[0] = "isPaused";
    fieldNames[1] = "lastGlobalOffline";
    fieldNames[2] = "lastGlobalOnline";
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
   * @notice Get isPaused.
   */
  function getIsPaused(uint256 updatedBlockNumber) internal view returns (bool isPaused) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(updatedBlockNumber));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (_toBool(uint8(bytes1(_blob))));
  }

  /**
   * @notice Get isPaused.
   */
  function _getIsPaused(uint256 updatedBlockNumber) internal view returns (bool isPaused) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(updatedBlockNumber));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (_toBool(uint8(bytes1(_blob))));
  }

  /**
   * @notice Set isPaused.
   */
  function setIsPaused(uint256 updatedBlockNumber, bool isPaused) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(updatedBlockNumber));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((isPaused)), _fieldLayout);
  }

  /**
   * @notice Set isPaused.
   */
  function _setIsPaused(uint256 updatedBlockNumber, bool isPaused) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(updatedBlockNumber));

    StoreCore.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((isPaused)), _fieldLayout);
  }

  /**
   * @notice Get lastGlobalOffline.
   */
  function getLastGlobalOffline(uint256 updatedBlockNumber) internal view returns (uint256 lastGlobalOffline) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(updatedBlockNumber));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /**
   * @notice Get lastGlobalOffline.
   */
  function _getLastGlobalOffline(uint256 updatedBlockNumber) internal view returns (uint256 lastGlobalOffline) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(updatedBlockNumber));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /**
   * @notice Set lastGlobalOffline.
   */
  function setLastGlobalOffline(uint256 updatedBlockNumber, uint256 lastGlobalOffline) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(updatedBlockNumber));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((lastGlobalOffline)), _fieldLayout);
  }

  /**
   * @notice Set lastGlobalOffline.
   */
  function _setLastGlobalOffline(uint256 updatedBlockNumber, uint256 lastGlobalOffline) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(updatedBlockNumber));

    StoreCore.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((lastGlobalOffline)), _fieldLayout);
  }

  /**
   * @notice Get lastGlobalOnline.
   */
  function getLastGlobalOnline(uint256 updatedBlockNumber) internal view returns (uint256 lastGlobalOnline) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(updatedBlockNumber));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 2, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /**
   * @notice Get lastGlobalOnline.
   */
  function _getLastGlobalOnline(uint256 updatedBlockNumber) internal view returns (uint256 lastGlobalOnline) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(updatedBlockNumber));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 2, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /**
   * @notice Set lastGlobalOnline.
   */
  function setLastGlobalOnline(uint256 updatedBlockNumber, uint256 lastGlobalOnline) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(updatedBlockNumber));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 2, abi.encodePacked((lastGlobalOnline)), _fieldLayout);
  }

  /**
   * @notice Set lastGlobalOnline.
   */
  function _setLastGlobalOnline(uint256 updatedBlockNumber, uint256 lastGlobalOnline) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(updatedBlockNumber));

    StoreCore.setStaticField(_tableId, _keyTuple, 2, abi.encodePacked((lastGlobalOnline)), _fieldLayout);
  }

  /**
   * @notice Get the full data.
   */
  function get(uint256 updatedBlockNumber) internal view returns (GlobalDeployableStateData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(updatedBlockNumber));

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
  function _get(uint256 updatedBlockNumber) internal view returns (GlobalDeployableStateData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(updatedBlockNumber));

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
    uint256 updatedBlockNumber,
    bool isPaused,
    uint256 lastGlobalOffline,
    uint256 lastGlobalOnline
  ) internal {
    bytes memory _staticData = encodeStatic(isPaused, lastGlobalOffline, lastGlobalOnline);

    EncodedLengths _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(updatedBlockNumber));

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function _set(
    uint256 updatedBlockNumber,
    bool isPaused,
    uint256 lastGlobalOffline,
    uint256 lastGlobalOnline
  ) internal {
    bytes memory _staticData = encodeStatic(isPaused, lastGlobalOffline, lastGlobalOnline);

    EncodedLengths _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(updatedBlockNumber));

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function set(uint256 updatedBlockNumber, GlobalDeployableStateData memory _table) internal {
    bytes memory _staticData = encodeStatic(_table.isPaused, _table.lastGlobalOffline, _table.lastGlobalOnline);

    EncodedLengths _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(updatedBlockNumber));

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function _set(uint256 updatedBlockNumber, GlobalDeployableStateData memory _table) internal {
    bytes memory _staticData = encodeStatic(_table.isPaused, _table.lastGlobalOffline, _table.lastGlobalOnline);

    EncodedLengths _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(updatedBlockNumber));

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Decode the tightly packed blob of static data using this table's field layout.
   */
  function decodeStatic(
    bytes memory _blob
  ) internal pure returns (bool isPaused, uint256 lastGlobalOffline, uint256 lastGlobalOnline) {
    isPaused = (_toBool(uint8(Bytes.getBytes1(_blob, 0))));

    lastGlobalOffline = (uint256(Bytes.getBytes32(_blob, 1)));

    lastGlobalOnline = (uint256(Bytes.getBytes32(_blob, 33)));
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
  ) internal pure returns (GlobalDeployableStateData memory _table) {
    (_table.isPaused, _table.lastGlobalOffline, _table.lastGlobalOnline) = decodeStatic(_staticData);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function deleteRecord(uint256 updatedBlockNumber) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(updatedBlockNumber));

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function _deleteRecord(uint256 updatedBlockNumber) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(updatedBlockNumber));

    StoreCore.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }

  /**
   * @notice Tightly pack static (fixed length) data using this table's schema.
   * @return The static data, encoded into a sequence of bytes.
   */
  function encodeStatic(
    bool isPaused,
    uint256 lastGlobalOffline,
    uint256 lastGlobalOnline
  ) internal pure returns (bytes memory) {
    return abi.encodePacked(isPaused, lastGlobalOffline, lastGlobalOnline);
  }

  /**
   * @notice Encode all of a record's fields.
   * @return The static (fixed length) data, encoded into a sequence of bytes.
   * @return The lengths of the dynamic fields (packed into a single bytes32 value).
   * @return The dynamic (variable length) data, encoded into a sequence of bytes.
   */
  function encode(
    bool isPaused,
    uint256 lastGlobalOffline,
    uint256 lastGlobalOnline
  ) internal pure returns (bytes memory, EncodedLengths, bytes memory) {
    bytes memory _staticData = encodeStatic(isPaused, lastGlobalOffline, lastGlobalOnline);

    EncodedLengths _encodedLengths;
    bytes memory _dynamicData;

    return (_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Encode keys as a bytes32 array using this table's field layout.
   */
  function encodeKeyTuple(uint256 updatedBlockNumber) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(updatedBlockNumber));

    return _keyTuple;
  }
}

/**
 * @notice Cast a value to a bool.
 * @dev Boolean values are encoded as uint8 (1 = true, 0 = false), but Solidity doesn't allow casting between uint8 and bool.
 * @param value The uint8 value to convert.
 * @return result The boolean value.
 */
function _toBool(uint8 value) pure returns (bool result) {
  assembly {
    result := value
  }
}
