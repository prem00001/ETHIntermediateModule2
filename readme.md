# Digital Decentralized Currency Exchange

Welcome to the Digital Decentralized Currency Exchange! This project allows you to interact with an Ethereum-based ATM smart contract using MetaMask. You can deposit, withdraw, and buy products with Ether. This README provides an overview of the project and instructions for getting started.

## Features

- **Connect with MetaMask**: Link your Ethereum wallet to interact with the ATM.
- **Deposit and Withdraw Ether**: Deposit or withdraw Ether in various amounts.
- **Buy Products**: Purchase products for a specified amount of Ether.
- **Human Verification**: Simple verification to ensure you're not a bot.

## Setup

### Prerequisites

- **MetaMask**: Install the MetaMask browser extension to connect your Ethereum wallet.
- **React**: Ensure you have `react`, `ethers`, and other necessary packages installed.

### Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/prem00001/EthIntermediateModule2.git
    ```

2. Install dependencies:

    ```bash
    npm install
    ```

3. Place your smart contract ABI file (`Assessment.json`) in the `artifacts/contracts/Assessment.sol/` directory.

### Configuration

- **Contract Address**: Update the `contractAddress` variable in `HomePage` with your deployed contract address.
- **Network**: Ensure you're connected to the appropriate Ethereum network (e.g., Ropsten, Mainnet).

## Usage

1. **Start the Application**:

 + Inside the project directory, in the terminal type: npm i
 + Open two additional terminals in your VS code
 + In the second terminal type: npx hardhat node
 + In the third terminal, type: npx hardhat run --network localhost scripts/deploy.js
 + Back in the first terminal, type npm run dev to launch the front-end.

After this, the project will be running on your localhost. 
Typically at http://localhost:3000/


2. **Open the Application**: Navigate to `http://localhost:3000` in your browser.

3. **Connect Your Wallet**: Click the "Connect your Metamask wallet" button to link your Ethereum account.

4. **Perform Actions**:
   - **Deposit**: Choose an amount to deposit or use preset options (1 ETH or 2 ETH).
   - **Withdraw**: Choose an amount to withdraw or use preset options (1 ETH or 2 ETH).
   - **Buy Product**: Purchase products for 1 ETH or 2 ETH.

5. **Verification**: Enter a number between 10 and 99 to verify you're not a bot.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgements

- [MetaMask](https://metamask.io/) for Ethereum wallet integration.
- [Ethers.js](https://docs.ethers.io/v5/) for interacting with the Ethereum blockchain.
After cloning the github, you will want to do the following to get the code running on your computer.
