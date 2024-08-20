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

struct ExecutionContextData {
  bool exists;
  uint256 blocknumber;
  bytes32[] callHistory;
}

library ExecutionContext {
  // Hex below is the result of `WorldResourceIdLib.encode({ namespace: "eveworld", name: "ExecutionContext", typeId: RESOURCE_TABLE });`
  ResourceId constant _tableId = ResourceId.wrap(0x7462657665776f726c64000000000000457865637574696f6e436f6e74657874);

  FieldLayout constant _fieldLayout =
    FieldLayout.wrap(0x0021020101200000000000000000000000000000000000000000000000000000);

  // Hex-encoded key schema of (bytes32)
  Schema constant _keySchema = Schema.wrap(0x002001005f000000000000000000000000000000000000000000000000000000);
  // Hex-encoded value schema of (bool, uint256, bytes32[])
  Schema constant _valueSchema = Schema.wrap(0x00210201601fc100000000000000000000000000000000000000000000000000);

  /**
   * @notice Get the table's key field names.
   * @return keyNames An array of strings with the names of key fields.
   */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](1);
    keyNames[0] = "executionId";
  }

  /**
   * @notice Get the table's value field names.
   * @return fieldNames An array of strings with the names of value fields.
   */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](3);
    fieldNames[0] = "exists";
    fieldNames[1] = "blocknumber";
    fieldNames[2] = "callHistory";
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
   * @notice Get exists.
   */
  function getExists(bytes32 executionId) internal view returns (bool exists) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = executionId;

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (_toBool(uint8(bytes1(_blob))));
  }

  /**
   * @notice Get exists.
   */
  function _getExists(bytes32 executionId) internal view returns (bool exists) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = executionId;

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (_toBool(uint8(bytes1(_blob))));
  }

  /**
   * @notice Set exists.
   */
  function setExists(bytes32 executionId, bool exists) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = executionId;

    StoreSwitch.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((exists)), _fieldLayout);
  }

  /**
   * @notice Set exists.
   */
  function _setExists(bytes32 executionId, bool exists) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = executionId;

    StoreCore.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((exists)), _fieldLayout);
  }

  /**
   * @notice Get blocknumber.
   */
  function getBlocknumber(bytes32 executionId) internal view returns (uint256 blocknumber) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = executionId;

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /**
   * @notice Get blocknumber.
   */
  function _getBlocknumber(bytes32 executionId) internal view returns (uint256 blocknumber) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = executionId;

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /**
   * @notice Set blocknumber.
   */
  function setBlocknumber(bytes32 executionId, uint256 blocknumber) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = executionId;

    StoreSwitch.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((blocknumber)), _fieldLayout);
  }

  /**
   * @notice Set blocknumber.
   */
  function _setBlocknumber(bytes32 executionId, uint256 blocknumber) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = executionId;

    StoreCore.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((blocknumber)), _fieldLayout);
  }

  /**
   * @notice Get callHistory.
   */
  function getCallHistory(bytes32 executionId) internal view returns (bytes32[] memory callHistory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = executionId;

    bytes memory _blob = StoreSwitch.getDynamicField(_tableId, _keyTuple, 0);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /**
   * @notice Get callHistory.
   */
  function _getCallHistory(bytes32 executionId) internal view returns (bytes32[] memory callHistory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = executionId;

    bytes memory _blob = StoreCore.getDynamicField(_tableId, _keyTuple, 0);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /**
   * @notice Set callHistory.
   */
  function setCallHistory(bytes32 executionId, bytes32[] memory callHistory) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = executionId;

    StoreSwitch.setDynamicField(_tableId, _keyTuple, 0, EncodeArray.encode((callHistory)));
  }

  /**
   * @notice Set callHistory.
   */
  function _setCallHistory(bytes32 executionId, bytes32[] memory callHistory) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = executionId;

    StoreCore.setDynamicField(_tableId, _keyTuple, 0, EncodeArray.encode((callHistory)));
  }

  /**
   * @notice Get the length of callHistory.
   */
  function lengthCallHistory(bytes32 executionId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = executionId;

    uint256 _byteLength = StoreSwitch.getDynamicFieldLength(_tableId, _keyTuple, 0);
    unchecked {
      return _byteLength / 32;
    }
  }

  /**
   * @notice Get the length of callHistory.
   */
  function _lengthCallHistory(bytes32 executionId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = executionId;

    uint256 _byteLength = StoreCore.getDynamicFieldLength(_tableId, _keyTuple, 0);
    unchecked {
      return _byteLength / 32;
    }
  }

  /**
   * @notice Get an item of callHistory.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function getItemCallHistory(bytes32 executionId, uint256 _index) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = executionId;

    unchecked {
      bytes memory _blob = StoreSwitch.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 32, (_index + 1) * 32);
      return (bytes32(_blob));
    }
  }

  /**
   * @notice Get an item of callHistory.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function _getItemCallHistory(bytes32 executionId, uint256 _index) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = executionId;

    unchecked {
      bytes memory _blob = StoreCore.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 32, (_index + 1) * 32);
      return (bytes32(_blob));
    }
  }

  /**
   * @notice Push an element to callHistory.
   */
  function pushCallHistory(bytes32 executionId, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = executionId;

    StoreSwitch.pushToDynamicField(_tableId, _keyTuple, 0, abi.encodePacked((_element)));
  }

  /**
   * @notice Push an element to callHistory.
   */
  function _pushCallHistory(bytes32 executionId, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = executionId;

    StoreCore.pushToDynamicField(_tableId, _keyTuple, 0, abi.encodePacked((_element)));
  }

  /**
   * @notice Pop an element from callHistory.
   */
  function popCallHistory(bytes32 executionId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = executionId;

    StoreSwitch.popFromDynamicField(_tableId, _keyTuple, 0, 32);
  }

  /**
   * @notice Pop an element from callHistory.
   */
  function _popCallHistory(bytes32 executionId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = executionId;

    StoreCore.popFromDynamicField(_tableId, _keyTuple, 0, 32);
  }

  /**
   * @notice Update an element of callHistory at `_index`.
   */
  function updateCallHistory(bytes32 executionId, uint256 _index, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = executionId;

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreSwitch.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 32), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Update an element of callHistory at `_index`.
   */
  function _updateCallHistory(bytes32 executionId, uint256 _index, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = executionId;

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreCore.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 32), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Get the full data.
   */
  function get(bytes32 executionId) internal view returns (ExecutionContextData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = executionId;

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
  function _get(bytes32 executionId) internal view returns (ExecutionContextData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = executionId;

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
  function set(bytes32 executionId, bool exists, uint256 blocknumber, bytes32[] memory callHistory) internal {
    bytes memory _staticData = encodeStatic(exists, blocknumber);

    EncodedLengths _encodedLengths = encodeLengths(callHistory);
    bytes memory _dynamicData = encodeDynamic(callHistory);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = executionId;

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function _set(bytes32 executionId, bool exists, uint256 blocknumber, bytes32[] memory callHistory) internal {
    bytes memory _staticData = encodeStatic(exists, blocknumber);

    EncodedLengths _encodedLengths = encodeLengths(callHistory);
    bytes memory _dynamicData = encodeDynamic(callHistory);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = executionId;

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function set(bytes32 executionId, ExecutionContextData memory _table) internal {
    bytes memory _staticData = encodeStatic(_table.exists, _table.blocknumber);

    EncodedLengths _encodedLengths = encodeLengths(_table.callHistory);
    bytes memory _dynamicData = encodeDynamic(_table.callHistory);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = executionId;

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function _set(bytes32 executionId, ExecutionContextData memory _table) internal {
    bytes memory _staticData = encodeStatic(_table.exists, _table.blocknumber);

    EncodedLengths _encodedLengths = encodeLengths(_table.callHistory);
    bytes memory _dynamicData = encodeDynamic(_table.callHistory);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = executionId;

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Decode the tightly packed blob of static data using this table's field layout.
   */
  function decodeStatic(bytes memory _blob) internal pure returns (bool exists, uint256 blocknumber) {
    exists = (_toBool(uint8(Bytes.getBytes1(_blob, 0))));

    blocknumber = (uint256(Bytes.getBytes32(_blob, 1)));
  }

  /**
   * @notice Decode the tightly packed blob of dynamic data using the encoded lengths.
   */
  function decodeDynamic(
    EncodedLengths _encodedLengths,
    bytes memory _blob
  ) internal pure returns (bytes32[] memory callHistory) {
    uint256 _start;
    uint256 _end;
    unchecked {
      _end = _encodedLengths.atIndex(0);
    }
    callHistory = (SliceLib.getSubslice(_blob, _start, _end).decodeArray_bytes32());
  }

  /**
   * @notice Decode the tightly packed blobs using this table's field layout.
   * @param _staticData Tightly packed static fields.
   * @param _encodedLengths Encoded lengths of dynamic fields.
   * @param _dynamicData Tightly packed dynamic fields.
   */
  function decode(
    bytes memory _staticData,
    EncodedLengths _encodedLengths,
    bytes memory _dynamicData
  ) internal pure returns (ExecutionContextData memory _table) {
    (_table.exists, _table.blocknumber) = decodeStatic(_staticData);

    (_table.callHistory) = decodeDynamic(_encodedLengths, _dynamicData);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function deleteRecord(bytes32 executionId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = executionId;

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function _deleteRecord(bytes32 executionId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = executionId;

    StoreCore.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }

  /**
   * @notice Tightly pack static (fixed length) data using this table's schema.
   * @return The static data, encoded into a sequence of bytes.
   */
  function encodeStatic(bool exists, uint256 blocknumber) internal pure returns (bytes memory) {
    return abi.encodePacked(exists, blocknumber);
  }

  /**
   * @notice Tightly pack dynamic data lengths using this table's schema.
   * @return _encodedLengths The lengths of the dynamic fields (packed into a single bytes32 value).
   */
  function encodeLengths(bytes32[] memory callHistory) internal pure returns (EncodedLengths _encodedLengths) {
    // Lengths are effectively checked during copy by 2**40 bytes exceeding gas limits
    unchecked {
      _encodedLengths = EncodedLengthsLib.pack(callHistory.length * 32);
    }
  }

  /**
   * @notice Tightly pack dynamic (variable length) data using this table's schema.
   * @return The dynamic data, encoded into a sequence of bytes.
   */
  function encodeDynamic(bytes32[] memory callHistory) internal pure returns (bytes memory) {
    return abi.encodePacked(EncodeArray.encode((callHistory)));
  }

  /**
   * @notice Encode all of a record's fields.
   * @return The static (fixed length) data, encoded into a sequence of bytes.
   * @return The lengths of the dynamic fields (packed into a single bytes32 value).
   * @return The dynamic (variable length) data, encoded into a sequence of bytes.
   */
  function encode(
    bool exists,
    uint256 blocknumber,
    bytes32[] memory callHistory
  ) internal pure returns (bytes memory, EncodedLengths, bytes memory) {
    bytes memory _staticData = encodeStatic(exists, blocknumber);

    EncodedLengths _encodedLengths = encodeLengths(callHistory);
    bytes memory _dynamicData = encodeDynamic(callHistory);

    return (_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Encode keys as a bytes32 array using this table's field layout.
   */
  function encodeKeyTuple(bytes32 executionId) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = executionId;

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
