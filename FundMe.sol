// SPDX-License-Identifier: MIT

pragma solidity >=0.6.6 <0.9.0;

import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";
import "@chainlink/contracts/src/v0.6/vendor/SafeMathChainlink.sol";
contract FundMe {
    using SafeMathChainlink for uint256;
    mapping(address => uint256) public addressToAmountFunded;
    function fund() public payable {
        // $50
        uint256 minimumUSD = 50 * (10 ** 18);
        require(getConversionRate(msg.value) >= minimumUSD, "You need to spend more ETH!");
        addressToAmountFunded[msg.sender] += msg.value;
        
    }

    function getVersion() public view returns (uint256) {
      AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
      return priceFeed.version();  
    }

    function getPrice() public view returns (uint256) {
      AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
      (,int256 answer,,,) = priceFeed.latestRoundData();
      return uint(answer*10000000000);
      //2,735.00457561
    }

    function getConversionRate(uint256 ethAmount) public view returns (uint256){
      uint256 ethPrice = getPrice();
      uint256 ethAmountInUsd = (ethPrice*ethAmount)/(1000000000000000000);
      return ethAmountInUsd; 
    }

    function withdraw() payable public {
      msg.sender.transfer(address(this).balance);
    }
}
