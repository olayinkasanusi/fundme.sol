// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

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

    function getPrice() public view returns(uint256){
    AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    (, int256 price,,,)=priceFeed.latestRoundData();
    // Price of ETH in terms of USD

    return uint256(price * 1e10);
    }
function getConversionRate(uint256 ethAmount) public view returns(uint256) {
    uint256 ethPrice = getPrice();
    uint256 ethAmountInUsd = (ethAmount *ethPrice)/ ( 1e18);
    return ethAmountInUsd;
    }

    function getVersion() public view returns(uint256){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
   
    }
}