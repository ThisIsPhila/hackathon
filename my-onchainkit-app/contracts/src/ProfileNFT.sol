// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/Base64.sol";

contract ProfileNFT is ERC721 {
    using Strings for uint256;
    
    uint256 private _tokenIdCounter;
    
    struct Profile {
        string username;
        uint256 wins;
        uint256 losses;
        uint256 cringeCageUntil;
        bool exists;
    }
    
    mapping(uint256 => Profile) public profiles;
    mapping(address => uint256) public ownerToTokenId;
    mapping(string => bool) public usernameTaken;
    
    event ProfileCreated(address indexed owner, uint256 indexed tokenId, string username);
    event BattleRecorded(uint256 indexed winnerId, uint256 indexed loserId);
    event CringeCageApplied(uint256 indexed tokenId, uint256 until);
    
    constructor() ERC721("Based AF Profile", "BASEDAF") {}
    
    function createProfile(string memory username) external returns (uint256) {
        require(bytes(username).length > 0 && bytes(username).length <= 20, "Invalid username length");
        require(!usernameTaken[username], "Username taken");
        require(ownerToTokenId[msg.sender] == 0, "Profile already exists");
        
        _tokenIdCounter++;
        uint256 newTokenId = _tokenIdCounter;
        
        _safeMint(msg.sender, newTokenId);
        
        profiles[newTokenId] = Profile({
            username: username,
            wins: 0,
            losses: 0,
            cringeCageUntil: 0,
            exists: true
        });
        
        ownerToTokenId[msg.sender] = newTokenId;
        usernameTaken[username] = true;
        
        emit ProfileCreated(msg.sender, newTokenId, username);
        
        return newTokenId;
    }
    
    function recordBattle(uint256 winnerId, uint256 loserId) external {
        require(profiles[winnerId].exists && profiles[loserId].exists, "Profile doesn't exist");
        
        profiles[winnerId].wins++;
        profiles[loserId].losses++;
        
        emit BattleRecorded(winnerId, loserId);
    }
    
    function applyCringeCage(uint256 tokenId, uint256 duration) external {
        require(profiles[tokenId].exists, "Profile doesn't exist");
        
        uint256 cageUntil = block.timestamp + duration;
        profiles[tokenId].cringeCageUntil = cageUntil;
        
        emit CringeCageApplied(tokenId, cageUntil);
    }
    
    function isInCringeCage(uint256 tokenId) public view returns (bool) {
        return block.timestamp < profiles[tokenId].cringeCageUntil;
    }
    
    function getProfile(uint256 tokenId) external view returns (Profile memory) {
        require(profiles[tokenId].exists, "Profile doesn't exist");
        return profiles[tokenId];
    }
    
    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        require(ownerOf(tokenId) != address(0), "Token doesn't exist");
        
        Profile memory profile = profiles[tokenId];
        bool inCage = isInCringeCage(tokenId);
        
        string memory svg = string(abi.encodePacked(
            '<svg xmlns="http://www.w3.org/2000/svg" width="400" height="400" style="background:#0052FF">',
            '<rect width="400" height="400" fill="',
            inCage ? '#FF0000' : '#0052FF',
            '"/>',
            '<text x="200" y="100" font-size="32" fill="white" text-anchor="middle" font-family="monospace">',
            profile.username,
            '</text>',
            '<text x="200" y="200" font-size="24" fill="white" text-anchor="middle" font-family="monospace">',
            'W: ', profile.wins.toString(), ' | L: ', profile.losses.toString(),
            '</text>',
            inCage ? '<text x="200" y="300" font-size="64" fill="white" text-anchor="middle" font-family="monospace">L</text>' : '',
            inCage ? '<text x="200" y="350" font-size="16" fill="white" text-anchor="middle" font-family="monospace">CRINGE CAGE</text>' : '',
            '</svg>'
        ));
        
        string memory json = Base64.encode(bytes(string(abi.encodePacked(
            '{"name": "',
            profile.username,
            '", "description": "Based AF Profile NFT", "image": "data:image/svg+xml;base64,',
            Base64.encode(bytes(svg)),
            '", "attributes": [{"trait_type": "Wins", "value": ',
            profile.wins.toString(),
            '}, {"trait_type": "Losses", "value": ',
            profile.losses.toString(),
            '}, {"trait_type": "In Cringe Cage", "value": "',
            inCage ? 'Yes' : 'No',
            '"}]}'
        ))));
        
        return string(abi.encodePacked('data:application/json;base64,', json));
    }
}
