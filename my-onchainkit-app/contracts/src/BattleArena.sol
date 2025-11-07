// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./CloutToken.sol";
import "./ProfileNFT.sol";
import "./MemeNFT.sol";

contract BattleArena {
    CloutToken public cloutToken;
    ProfileNFT public profileNFT;
    MemeNFT public memeNFT;
    
    uint256 private _battleIdCounter;
    
    uint256 public constant BATTLE_DURATION = 2 minutes;
    uint256 public constant CRINGE_CAGE_DURATION = 1 hours;
    uint256 public constant VOTE_COST = 1 * 10**18; // 1 CLOUT
    
    enum BattleStatus { Active, Finished, Cancelled }
    
    struct Battle {
        uint256 challenger;
        uint256 opponent;
        string challengerMeme;
        string opponentMeme;
        uint256 challengerVotes;
        uint256 opponentVotes;
        uint256 startTime;
        uint256 endTime;
        BattleStatus status;
        uint256 winnerId;
    }
    
    mapping(uint256 => Battle) public battles;
    mapping(uint256 => mapping(address => uint256)) public battleVotes; // battleId => voter => amount
    
    event BattleDeclared(uint256 indexed battleId, uint256 indexed challenger, uint256 indexed opponent);
    event MemesSubmitted(uint256 indexed battleId, string challengerMeme, string opponentMeme);
    event VoteCast(uint256 indexed battleId, address indexed voter, uint256 indexed profileId, uint256 amount);
    event BattleFinished(uint256 indexed battleId, uint256 indexed winner, uint256 indexed loser);
    event PowerUpUsed(uint256 indexed battleId, address indexed user, string powerUpType);
    
    constructor(address _cloutToken, address _profileNFT, address _memeNFT) {
        cloutToken = CloutToken(_cloutToken);
        profileNFT = ProfileNFT(_profileNFT);
        memeNFT = MemeNFT(_memeNFT);
    }
    
    function declareWar(uint256 challengerProfileId, uint256 opponentProfileId) external returns (uint256) {
        require(profileNFT.ownerOf(challengerProfileId) == msg.sender, "Not profile owner");
        require(profileNFT.ownerOf(opponentProfileId) != address(0), "Opponent doesn't exist");
        require(!profileNFT.isInCringeCage(challengerProfileId), "You're in Cringe Cage");
        
        _battleIdCounter++;
        uint256 battleId = _battleIdCounter;
        
        battles[battleId] = Battle({
            challenger: challengerProfileId,
            opponent: opponentProfileId,
            challengerMeme: "",
            opponentMeme: "",
            challengerVotes: 0,
            opponentVotes: 0,
            startTime: 0,
            endTime: 0,
            status: BattleStatus.Active,
            winnerId: 0
        });
        
        emit BattleDeclared(battleId, challengerProfileId, opponentProfileId);
        
        return battleId;
    }
    
    function submitMemes(
        uint256 battleId,
        string memory challengerMeme,
        string memory opponentMeme
    ) external {
        Battle storage battle = battles[battleId];
        require(battle.status == BattleStatus.Active, "Battle not active");
        require(bytes(challengerMeme).length > 0 && bytes(opponentMeme).length > 0, "Empty memes");
        
        battle.challengerMeme = challengerMeme;
        battle.opponentMeme = opponentMeme;
        battle.startTime = block.timestamp;
        battle.endTime = block.timestamp + BATTLE_DURATION;
        
        emit MemesSubmitted(battleId, challengerMeme, opponentMeme);
    }
    
    function vote(uint256 battleId, uint256 profileId, uint256 amount) external {
        Battle storage battle = battles[battleId];
        require(battle.status == BattleStatus.Active, "Battle not active");
        require(block.timestamp >= battle.startTime && block.timestamp <= battle.endTime, "Not in voting period");
        require(profileId == battle.challenger || profileId == battle.opponent, "Invalid profile");
        require(amount >= VOTE_COST, "Insufficient vote amount");
        
        require(cloutToken.transferFrom(msg.sender, address(this), amount), "Transfer failed");
        
        battleVotes[battleId][msg.sender] += amount;
        
        if (profileId == battle.challenger) {
            battle.challengerVotes += amount;
        } else {
            battle.opponentVotes += amount;
        }
        
        emit VoteCast(battleId, msg.sender, profileId, amount);
    }
    
    function finishBattle(uint256 battleId) external returns (uint256 winnerId, uint256 loserId) {
        Battle storage battle = battles[battleId];
        require(battle.status == BattleStatus.Active, "Battle not active");
        require(block.timestamp > battle.endTime, "Battle still ongoing");
        
        winnerId = battle.challengerVotes >= battle.opponentVotes ? battle.challenger : battle.opponent;
        loserId = winnerId == battle.challenger ? battle.opponent : battle.challenger;
        
        battle.winnerId = winnerId;
        battle.status = BattleStatus.Finished;
        
        // Record battle result
        profileNFT.recordBattle(winnerId, loserId);
        
        // Apply Cringe Cage to loser
        profileNFT.applyCringeCage(loserId, CRINGE_CAGE_DURATION);
        
        // Mint winner's meme as NFT
        string memory winnerMeme = winnerId == battle.challenger ? battle.challengerMeme : battle.opponentMeme;
        memeNFT.mintMeme(profileNFT.ownerOf(winnerId), winnerMeme, battleId, true);
        
        emit BattleFinished(battleId, winnerId, loserId);
        
        return (winnerId, loserId);
    }
    
    function usePowerUp(uint256 battleId, string memory powerUpType) external {
        Battle storage battle = battles[battleId];
        require(battle.status == BattleStatus.Active, "Battle not active");
        require(block.timestamp >= battle.startTime && block.timestamp <= battle.endTime, "Not in voting period");
        
        // Power-ups cost CLOUT
        uint256 cost = 100 * 10**18; // 100 CLOUT
        require(cloutToken.transferFrom(msg.sender, address(this), cost), "Transfer failed");
        
        emit PowerUpUsed(battleId, msg.sender, powerUpType);
        
        // Power-up effects handled in frontend
    }
    
    function getBattle(uint256 battleId) external view returns (Battle memory) {
        return battles[battleId];
    }
    
    function getCurrentBattles() external view returns (uint256[] memory) {
        uint256 count = 0;
        for (uint256 i = 1; i <= _battleIdCounter; i++) {
            if (battles[i].status == BattleStatus.Active) {
                count++;
            }
        }
        
        uint256[] memory activeBattles = new uint256[](count);
        uint256 index = 0;
        for (uint256 i = 1; i <= _battleIdCounter; i++) {
            if (battles[i].status == BattleStatus.Active) {
                activeBattles[index] = i;
                index++;
            }
        }
        
        return activeBattles;
    }
}
