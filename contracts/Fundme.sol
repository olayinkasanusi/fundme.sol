// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe{
    using PriceConverter for uint256;

uint256 public minimumUsd = 5e18;
mapping(address=> uint256) public addressToAmountFunded;

address[] public funders;

    address public owner;

    constructor(){
        owner = msg.sender;
    }

    function fund() public payable {
        require( msg.value.getConversionRate() >= minimumUsd, "didn't send enough ETH");
        funders.push(msg.sender);

        addressToAmountFunded[msg.sender] += msg.value;
    
    }

    function withdraw() public onlyOwner
    {
        
        for(uint256 funderIndex=0; funderIndex <funders.length; funderIndex++){
           address funder = funders[funderIndex];
           addressToAmountFunded[funder] = 0;
        }

        funders = new address[](0);

        // payable(msg.sender).transfer(address(this).balance);

        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "failed to send ETH");

        (bool callSuccess, )=payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");
    }

    modifier onlyOwner(){
        require(msg.sender == owner, 'Must be owner!');
        _;
    }
}