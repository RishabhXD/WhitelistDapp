// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract Whitelist {
    uint8 public maxWhitelistAddresses;

    //    Address checker if whitelisted
    mapping(address => bool) public whitelistedAddresses;

    // Number of whitelisted addresses
    uint8 public numAddressesWhitelisted;

    constructor(uint8 _maxWhitelistAddresses) {
        maxWhitelistAddresses = _maxWhitelistAddresses;
    }

    // Function to add address of sender to whitelisted addresses

    function addAddressToWhitelist() public {
        // checking if address is already whitelisted
        require(
            !whitelistedAddresses[msg.sender],
            "Sender is already whitelisted"
        );

        // checking if numAddressesWhitelisted < maxWhitelistAddresses
        require(
            maxWhitelistAddresses > numAddressesWhitelisted,
            "Limit Reached, Can't add more"
        );

        // Adding address to the list
        whitelistedAddresses[msg.sender] = true;

        // increasing number of whitelisted addresses
        numAddressesWhitelisted++;
    }
}
