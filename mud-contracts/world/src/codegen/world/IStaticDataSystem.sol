// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

/* Autogenerated file. Do not edit manually. */

import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";
import { StaticDataGlobalTableData } from "../tables/StaticDataGlobalTable.sol";

/**
 * @title IStaticDataSystem
 * @author MUD (https://mud.dev) by Lattice (https://lattice.xyz)
 * @dev This interface is automatically generated from the corresponding system contract. Do not edit manually.
 */
interface IStaticDataSystem {
  function eveworld__setBaseURI(ResourceId systemId, string memory baseURI) external;

  function eveworld__setName(ResourceId systemId, string memory name) external;

  function eveworld__setSymbol(ResourceId systemId, string memory symbol) external;

  function eveworld__setMetadata(ResourceId systemId, StaticDataGlobalTableData memory data) external;

  function eveworld__setCid(uint256 entityId, string memory cid) external;
}
