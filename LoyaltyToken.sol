// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract LoyaltyToken {
    mapping(address => uint256) public balances;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function issueTokens(address to, uint256 amount) external {
        require(msg.sender == owner, "Only owner can issue tokens");
        balances[to] += amount;
    }

    function transfer(address to, uint256 amount) external {
        require(balances[msg.sender] >= amount, "Not enough tokens");
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }

    function redeemTokens(uint256 amount) external {
        require(balances[msg.sender] >= amount, "Not enough tokens");
        balances[msg.sender] -= amount;
    }
}
