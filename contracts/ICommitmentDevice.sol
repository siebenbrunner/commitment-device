//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "hardhat/console.sol";

interface ICommitmentDevice {

    struct Commitment {
        uint256 id;
        bool isTriggered;
        address targetToken;
        address targetPool;
        uint256 targetPrice;
        uint256 maxInsurance;
        uint256 reserves;
    }

    event CommitmentCreated(
        uint256 id,
        address targetToken,
        address targetPool,
        uint256 targetPrice,
        uint256 maxInsurance,
        uint256 reserves
    );

    event CommitmentTriggered(uint256 id);

    event ReservesUpdated(
        uint256 commitmentId,
        uint256 newReserves
    );

    function createCommitment(
        address targetToken,
        address targetPool,
        uint256 targetPrice,
        uint256 maxInsurance
    ) payable external returns (uint256 id);

    function checkTrigger(uint256 id) external view returns (bool trigger);

    function triggerCommitment(uint256 id) external returns (bool trigger);

    function claimInsurance(uint256 commitmentId) external;

    function claimInsurance(address targetToken) external;

    function increaseCommitment(uint256 id) payable external;

    // to discuss: checks whether reserves > maxInsurance
    function decreaseCommitment(uint256 id) external;
}
