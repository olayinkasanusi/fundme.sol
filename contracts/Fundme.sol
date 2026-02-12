// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract FundMe{

uint256 public minimumUsd = 5;

    function fund() public payable {
        //Allow users to send $
        // Have a minimum amount of $ sent
        // 1. How do we send ETH to this contract?

   

        require(msg.value >= minimumUsd, "didn't send enough ETH");
    }

function withdraw() public
{

}
}