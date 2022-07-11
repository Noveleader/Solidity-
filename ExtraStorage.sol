//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

//inheritance of SimpleStorage in ExtraStorage
contract ExtraStorage is SimpleStorage{
    //overiding and virtual function
    function store(uint256 _favoriteNumber) public override{
        favoriteNumber = _favoriteNumber + 5;
    }
}
