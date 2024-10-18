// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

/* Autogenerated file. Do not edit manually. */

import { EntityRecordData, EntityMetadata } from "../../systems/entity-record/types.sol";

/**
 * @title IEntityRecordSystem
 * @author MUD (https://mud.dev) by Lattice (https://lattice.xyz)
 * @dev This interface is automatically generated from the corresponding system contract. Do not edit manually.
 */
interface IEntityRecordSystem {
  function evefrontier__createEntityRecord(uint256 smartObjectId, EntityRecordData memory entityRecord) external;

  function evefrontier__createEntityRecordMetadata(
    uint256 smartObjectId,
    EntityMetadata memory entityRecordMetadata
  ) external;

  function evefrontier__setName(uint256 smartObjectId, string memory name) external;

  function evefrontier__setDappURL(uint256 smartObjectId, string memory dappURL) external;

  function evefrontier__setDescription(uint256 smartObjectId, string memory description) external;
}
