// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Script.sol";
import "../src/CloutToken.sol";
import "../src/ProfileNFT.sol";
import "../src/MemeNFT.sol";
import "../src/BattleArena.sol";

contract DeployBasedAF is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        // Deploy CloutToken
        CloutToken cloutToken = new CloutToken();
        console.log("CloutToken deployed at:", address(cloutToken));

        // Deploy ProfileNFT
        ProfileNFT profileNFT = new ProfileNFT();
        console.log("ProfileNFT deployed at:", address(profileNFT));

        // Deploy MemeNFT
        MemeNFT memeNFT = new MemeNFT();
        console.log("MemeNFT deployed at:", address(memeNFT));

        // Deploy BattleArena
        BattleArena battleArena = new BattleArena(
            address(cloutToken),
            address(profileNFT),
            address(memeNFT)
        );
        console.log("BattleArena deployed at:", address(battleArena));

        vm.stopBroadcast();
    }
}
