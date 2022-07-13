//sending eth to the function and reverts
//Get funds from user 
//Withdarw funds
//Set a minimum funcing 

//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
contract FundMe {
    uint256 public minimumUSD = 50*10**18;
    function fund() public payable {
        //we want to set the minimum fund amount 
        //Txn have:
        //Nonce, gas price, gas limit , to, value, data, v,r,s (components of txn signature)
        //Function can also have similar functionalities
        //Smart Contract addresses can also hold funds just like the wallets
        require(getConversionRate(msg.value) >= minimumUSD, "Didn't send enough eth"); // 1e18 = 1*10**18 This value is 1eth or number of weis present in eth

        // msg.value returns the value in terms of wei

        //chainlink or oracles play their part to bring off chain data
        //blockchain oracle - get the off chain data and help interacting smart contracts with real world
        //chainlink oracle is the solution to this which is decentralized 
        //We can't call an API in smart contracts as for executing this nodes need to break the consensus

    }
    
    function getPrice() public view returns(uint256){
        // For external contract to run we need
        // ABI of the contract 
        // Address 0x8A753747A1Fa494EC906cE90E9f37563A8AF630e

        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        (,int256 price,,,) = priceFeed.latestRoundData(); //we only care for the price and not ther other variables that function returns
        return uint256(price*1e10);
    }

    function getConversionRate(uint256 ethAmount) public view returns (uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }
}
