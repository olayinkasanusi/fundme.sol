// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe{
    using PriceConverter for uint256;

uint256 public minimumUsd = 5e18;
mapping(address=> uint256) public addressToAmountFunded;

address[] public funders;
    function fund() public payable {
        require( msg.value.getConversionRate() >= minimumUsd, "didn't send enough ETH");
        funders.push(msg.sender);

        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    
    }

    function withdraw() public
    {
    }

//     function getPrice() public view returns(uint256){
//     AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);

//     (, int256 price,,,)=priceFeed.latestRoundData();
//     // Price of ETH in terms of USD

//     return uint256(price * 1e10);
//     }
// function getConversionRate(uint256 ethAmount) public view returns(uint256) {
//     uint256 ethPrice = getPrice();
//     uint256 ethAmountInUsd = (ethAmount *ethPrice)/ ( 1e18);
//     return ethAmountInUsd;
//     }

//     function getVersion() public view returns(uint256){
//         return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
   
//     }
}