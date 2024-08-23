// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Assessment {
    address payable public owner;
    uint256 public balance;

    uint256 public constant REWARD_THRESHOLD = 100 ether;
    uint256 public constant REWARD_AMOUNT = 10 ether;
    bool public rewardEarned = false;

    event Deposit(uint256 amount);
    event Withdraw(uint256 amount);
    event RewardEarned(uint256 amount);
    event ProductPurchased(address buyer, uint256 amount);

    constructor(uint initBalance) payable {
        owner = payable(msg.sender);
        balance = initBalance;
    }

    function getBalance() public view returns (uint256) {
        return balance;
    }

    function deposit(uint256 _amount) public payable {
        uint256 _previousBalance = balance;

        require(msg.sender == owner, "You are not the owner of this account");

        balance += _amount;

        assert(balance == _previousBalance + _amount);

        emit Deposit(_amount);

        // Check if the deposited amount in a single transaction is greater than the reward threshold
        if (_amount >= REWARD_THRESHOLD) {
            // Add reward amount to the balance
            balance += REWARD_AMOUNT;
            rewardEarned = true;
            emit RewardEarned(REWARD_AMOUNT);
        }
    }

    // Custom error
    error InsufficientBalance(uint256 balance, uint256 withdrawAmount);

    function withdraw(uint256 _withdrawAmount) public {
        require(msg.sender == owner, "You are not the owner of this account");
        uint256 _previousBalance = balance;
        if (balance < _withdrawAmount) {
            revert InsufficientBalance({
                balance: balance,
                withdrawAmount: _withdrawAmount
            });
        }

        // Withdraw the given amount
        balance -= _withdrawAmount;

        // Assert the balance is correct
        assert(balance == (_previousBalance - _withdrawAmount));

        // Emit the event
        emit Withdraw(_withdrawAmount);
    }

    // Function to allow a user to buy a product
    function buyProduct() public payable {
        require(msg.value > 0, "You need to send some ETH to buy the product");

        // Add the sent ETH to the contract's balance
        balance -= msg.value;

        // Emit the event for product purchase
        emit ProductPurchased(msg.sender, msg.value);
    }
}
