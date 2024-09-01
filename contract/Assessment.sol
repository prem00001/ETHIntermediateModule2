// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Assessment {
    address payable public owner;
    uint256 public balance;
    uint256 public constant REWARD_THRESHOLD = 100 ether;
    uint256 public constant REWARD_AMOUNT = 10 ether;
    bool public rewardEarned = false;

    struct Delivery {
        address buyer;
        string deliveryAddress;
        bool isConfirmed;
    }

    mapping(address => Delivery[]) public deliveries;

    event Deposit(uint256 amount);
    event Withdraw(uint256 amount);
    event RewardEarned(uint256 amount);
    event ProductPurchased(address buyer, uint256 amount);
    event DeliveryConfirmed(address buyer, string deliveryAddress);

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

        if (_amount >= REWARD_THRESHOLD && !rewardEarned) {
            balance += REWARD_AMOUNT;
            rewardEarned = true;
            emit RewardEarned(REWARD_AMOUNT);
        }
    }

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
        balance -= _withdrawAmount;
        assert(balance == (_previousBalance - _withdrawAmount));
        emit Withdraw(_withdrawAmount);
    }

    function buyProduct(string memory _deliveryAddress) public payable {
        require(msg.value > 0, "You need to send some ETH to buy the product");
        balance += msg.value;
        deliveries[msg.sender].push(Delivery({
            buyer: msg.sender,
            deliveryAddress: _deliveryAddress,
            isConfirmed: false
        }));
        emit ProductPurchased(msg.sender, msg.value);
    }

    function confirmDelivery(string memory _deliveryAddress) public {
        Delivery[] storage buyerDeliveries = deliveries[msg.sender];
        for (uint i = 0; i < buyerDeliveries.length; i++) {
            if (keccak256(bytes(buyerDeliveries[i].deliveryAddress)) == keccak256(bytes(_deliveryAddress)) && !buyerDeliveries[i].isConfirmed) {
                buyerDeliveries[i].isConfirmed = true;
                emit DeliveryConfirmed(msg.sender, _deliveryAddress);
                return;
            }
        }
        revert("No unconfirmed delivery found for this address");
    }
}
