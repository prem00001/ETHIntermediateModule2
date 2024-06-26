# Digital Decentralized Banking Service

This project implements a decentralized banking service using Ethereum blockchain technology. It allows users to connect their MetaMask wallet, check their account balance, deposit and withdraw Ether (ETH) from a smart contract deployed on the Ethereum network.

## Features

- **Connect Wallet**: Users can connect their MetaMask wallet to interact with the banking service.
- **Check Balance**: View the account balance in Ether (ETH).
- **Deposit and Withdraw**: Deposit or withdraw ETH from the connected wallet to the smart contract.
- **User Interface**: Simple and intuitive UI built using React.js.

## Technologies Used

- **React**: Frontend framework for building user interfaces.
- **Ethers.js**: Ethereum JavaScript library for interacting with Ethereum nodes.
- **MetaMask**: Ethereum wallet browser extension for interacting with the Ethereum blockchain.
- **Solidity**: Smart contract programming language used for writing Ethereum smart contracts.

## Functions

### Wallet Connection

- **getWallet**: Initializes the MetaMask wallet connection if available.
- **handleAccount**: Handles the retrieved Ethereum accounts from MetaMask.
- **connectAccount**: Initiates the connection process with MetaMask and retrieves user accounts.
- **getATMContract**: Retrieves and sets up the deployed ATM smart contract using ethers.js.
  
### Balance Management

- **getBalance**: Fetches and displays the current ETH balance of the connected account from the smart contract.
  
### Transactions

- **deposit**: Allows users to deposit a specified amount of ETH into the smart contract.
- **depositOneEth**: Shortcut function to deposit 1 ETH into the smart contract.
- **withdraw**: Enables users to withdraw a specified amount of ETH from the smart contract.
- **withdrawOneEth**: Shortcut function to withdraw 1 ETH from the smart contract.
  
### User Interface

- **initUser**: Manages the user interface based on the wallet connection status, displaying account information, balances, and transaction buttons.
  
### Dependencies

- **React**: Front-end framework for building the user interface.
- **ethers.js**: JavaScript library for interacting with Ethereum nodes and smart contracts.

## Repository Reference

For complete code files and further details, refer to the [SCM-Starter repository](https://github.com/MetacrafterChris/SCM-Starter/tree/main). This repository provides additional context and resources related to setting up similar projects.

---

This README provides an overview of the functionality and references external resources for deeper exploration. Adjustments can be made based on specific project details or additional functionalities.

