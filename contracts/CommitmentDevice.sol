//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./ICommitmentDevice.sol";

import "hardhat/console.sol";

abstract contract CommitmentDevice is ICommitmentDevice {
    mapping (uint256 => Commitment) public commitments;
    mapping (address => uint256) public commitmentIds;

}
