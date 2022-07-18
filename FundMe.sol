/*
sending eth to the function and reverts
Get funds from user 
Withdarw funds
Set a minimum funcing 
*/

//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./PriceConverter.sol"; //importing the library made in different file
// Gas Cost = 822980 while doing it through VM
// Transaction Cost = 803654 after using constant keyword for the variable

error notOwner(); //Declared outside of contract and are custom errors and end up saving a lot of gas as we are not calling full string
contract FundMe {
    using PriceConverter for uint256; //using library as a template for program 
    uint256 public constant MINIMUM_USD = 50*10**18; 
    /*
    21393 while using constant = 21393*9000000000 = $0.02 
    Here 9000000000 is the gas price of etherium in wei which gives answer in wei later converted to eth and USD
    23493 while it isn't used = 23493*9000000000 = #0.03
    */
    address[] public funders;
    uint256 public totalEth;
    mapping (address => uint256) public addressToAmountFunded;

    address public immutable i_owner;
    /*
    Keyword immutable also have similar gas savings as constant 
    A good practice is using i_ so that we know this variable is immutable
    Transaction Cost before immutable = 803654
    Transaction Cost after immutable = 780159
    */
    constructor(){
        //called right away when the contract is deployed
        i_owner = msg.sender;
    }
    function fund() public payable {
        /*
        we want to set the minimum fund amount 
        Txn have
        Nonce, gas price, gas limit , to, value, data, v,r,s (components of txn signature)
        Function can also have similar functionalities
        Smart Contract addresses can also hold funds just like the wallets
        */

        require(msg.value.getConversionRate() >= MINIMUM_USD, "Didn't send enough eth"); // 1e18 = 1*10**18 This value is 1eth or number of weis present in eth

        /*
        this msg.value is the first parameter of the function and in the bracket goes as a second parameter
        msg.value returns the value in terms of wei
        
        chainlink or oracles play their part to bring off chain data
        blockchain oracle - get the off chain data and help interacting smart contracts with real world
        chainlink oracle is the solution to this which is decentralized 
        We can't call an API in smart contracts as for executing this nodes need to break the consensus
        */
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
        totalEth += msg.value;
    }
    
    function withdraw() public onlyOnwer /*This will need to fit the modifier first to run further*/{
        /*only owner should call withdraw function
        require(msg.sender == owner); 
        
        for(uint256 funderIndex = 0; funderIndex<funders.length; funderIndex++){
            //Looping through the address array and mapping to set the balances to 0
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        reset the array
        also withdraw the funds
        */
        
        //We can reset the array by other method without looping 
        funders = new address[](0); //Here the mapping is not empited only the array is set to 0 mapping still have it keys as address and values as wallet money

        /*
        Withdrawing the funds can be done through
        Transfer
        Send
        call
        */

        /*
        Transfer - reverts if fails
        msg.sender = address
        payable(msg.sender) = payable address
        
        payable(msg.sender).transfer(address(this).balance);

        //Send - returns bool 
        bool sendSuccess = payable(msg.sender).send(address(this).balance);
        require(sendSuccess, "Send Failed"); //if send success is false then error message send failed is shown
        */

        //CALL IS RECOMMENDED NOW TO USE 
        //call - lower level command and it is powerful it also returns bool
        (bool callSuccess, /*bytes memory dataReturned*/) = payable(msg.sender).call{value : address(this).balance}("");
        require(callSuccess, "Call Failed"); //if call success is false then error message call failed is shown


    }

    modifier onlyOnwer {
        // require(msg.sender == i_owner, "Hey, you are not the owner of the contract");
        if(msg.sender != i_owner) {
            revert notOwner();
        }
        _; //This helps to run the rest of the code in the function modifier is used
    }

    // What happens if someone sends this contract ETH without calling the fund function
    // receive() It should be external payable and doesn't use the function keyword and don't have any arguments or return statement 
    // fallback()

    receive() external payable {
        fund();
    }

    fallback() external payable {
        fund();
    }
}
