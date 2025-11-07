// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/Base64.sol";

contract MemeNFT is ERC721 {
    using Strings for uint256;
    
    uint256 private _tokenIdCounter;
    
    struct Meme {
        string text;
        address creator;
        uint256 battleId;
        bool isWinner;
        uint256 timestamp;
    }
    
    mapping(uint256 => Meme) public memes;
    
    event MemeMinted(uint256 indexed tokenId, address indexed creator, string text, uint256 battleId);
    
    constructor() ERC721("Based AF Meme", "MEME") {}
    
    function mintMeme(
        address creator,
        string memory text,
        uint256 battleId,
        bool isWinner
    ) external returns (uint256) {
        require(bytes(text).length > 0 && bytes(text).length <= 280, "Invalid text length");
        
        _tokenIdCounter++;
        uint256 newTokenId = _tokenIdCounter;
        
        _safeMint(creator, newTokenId);
        
        memes[newTokenId] = Meme({
            text: text,
            creator: creator,
            battleId: battleId,
            isWinner: isWinner,
            timestamp: block.timestamp
        });
        
        emit MemeMinted(newTokenId, creator, text, battleId);
        
        return newTokenId;
    }
    
    function airdropMeme(uint256 tokenId, address[] calldata recipients) external {
        require(ownerOf(tokenId) == msg.sender, "Not meme owner");
        Meme memory originalMeme = memes[tokenId];
        
        for (uint256 i = 0; i < recipients.length; i++) {
            _tokenIdCounter++;
            uint256 newTokenId = _tokenIdCounter;
            
            _safeMint(recipients[i], newTokenId);
            
            memes[newTokenId] = Meme({
                text: string(abi.encodePacked(originalMeme.text, " [BASED BEAM]")),
                creator: originalMeme.creator,
                battleId: originalMeme.battleId,
                isWinner: originalMeme.isWinner,
                timestamp: block.timestamp
            });
        }
    }
    
    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        require(ownerOf(tokenId) != address(0), "Token doesn't exist");
        
        Meme memory meme = memes[tokenId];
        
        string memory svg = string(abi.encodePacked(
            '<svg xmlns="http://www.w3.org/2000/svg" width="600" height="400" style="background:',
            meme.isWinner ? '#00FF00' : '#FF6B00',
            '">',
            '<rect width="600" height="400" fill="',
            meme.isWinner ? '#00FF00' : '#FF6B00',
            '"/>',
            '<foreignObject x="50" y="100" width="500" height="200">',
            '<div xmlns="http://www.w3.org/1999/xhtml" style="font-family:monospace;font-size:24px;color:black;word-wrap:break-word;padding:20px">',
            meme.text,
            '</div>',
            '</foreignObject>',
            meme.isWinner ? '<text x="300" y="350" font-size="32" fill="black" text-anchor="middle" font-family="monospace">WINNER &#x1F525;</text>' : '',
            '</svg>'
        ));
        
        string memory json = Base64.encode(bytes(string(abi.encodePacked(
            '{"name": "Meme #',
            tokenId.toString(),
            '", "description": "Based AF Battle Meme", "image": "data:image/svg+xml;base64,',
            Base64.encode(bytes(svg)),
            '", "attributes": [{"trait_type": "Creator", "value": "',
            Strings.toHexString(uint160(meme.creator), 20),
            '"}, {"trait_type": "Battle ID", "value": ',
            meme.battleId.toString(),
            '}, {"trait_type": "Winner", "value": "',
            meme.isWinner ? 'Yes' : 'No',
            '"}]}'
        ))));
        
        return string(abi.encodePacked('data:application/json;base64,', json));
    }
}
