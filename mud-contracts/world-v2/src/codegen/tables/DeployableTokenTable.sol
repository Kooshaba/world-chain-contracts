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

library DeployableTokenTable {
  // Hex below is the result of `WorldResourceIdLib.encode({ namespace: "eveworld", name: "DeployableTokenT", typeId: RESOURCE_TABLE });`
  ResourceId constant _tableId = ResourceId.wrap(0x7462657665776f726c640000000000004465706c6f7961626c65546f6b656e54);

  FieldLayout constant _fieldLayout =
    FieldLayout.wrap(0x0014010014000000000000000000000000000000000000000000000000000000);

  // Hex-encoded key schema of (uint256)
  Schema constant _keySchema = Schema.wrap(0x002001001f000000000000000000000000000000000000000000000000000000);
  // Hex-encoded value schema of (address)
  Schema constant _valueSchema = Schema.wrap(0x0014010061000000000000000000000000000000000000000000000000000000);

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
    fieldNames = new string[](1);
    fieldNames[0] = "erc721Address";
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
   * @notice Get erc721Address.
   */
  function getErc721Address(uint256 entityId) internal view returns (address erc721Address) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(entityId));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (address(bytes20(_blob)));
  }

  /**
   * @notice Get erc721Address.
   */
  function _getErc721Address(uint256 entityId) internal view returns (address erc721Address) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(entityId));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (address(bytes20(_blob)));
  }

  /**
   * @notice Get erc721Address.
   */
  function get(uint256 entityId) internal view returns (address erc721Address) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(entityId));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (address(bytes20(_blob)));
  }

  /**
   * @notice Get erc721Address.
   */
  function _get(uint256 entityId) internal view returns (address erc721Address) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(entityId));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (address(bytes20(_blob)));
  }

  /**
   * @notice Set erc721Address.
   */
  function setErc721Address(uint256 entityId, address erc721Address) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(entityId));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((erc721Address)), _fieldLayout);
  }

  /**
   * @notice Set erc721Address.
   */
  function _setErc721Address(uint256 entityId, address erc721Address) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(entityId));

    StoreCore.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((erc721Address)), _fieldLayout);
  }

  /**
   * @notice Set erc721Address.
   */
  function set(uint256 entityId, address erc721Address) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(entityId));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((erc721Address)), _fieldLayout);
  }

  /**
   * @notice Set erc721Address.
   */
  function _set(uint256 entityId, address erc721Address) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(entityId));

    StoreCore.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((erc721Address)), _fieldLayout);
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
  function encodeStatic(address erc721Address) internal pure returns (bytes memory) {
    return abi.encodePacked(erc721Address);
  }

  /**
   * @notice Encode all of a record's fields.
   * @return The static (fixed length) data, encoded into a sequence of bytes.
   * @return The lengths of the dynamic fields (packed into a single bytes32 value).
   * @return The dynamic (variable length) data, encoded into a sequence of bytes.
   */
  function encode(address erc721Address) internal pure returns (bytes memory, EncodedLengths, bytes memory) {
    bytes memory _staticData = encodeStatic(erc721Address);

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
