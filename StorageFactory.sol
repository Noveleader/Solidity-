//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
//Smart contracts are composable since they can interact with each other easily

//importing other contracts from the same directory
import "./SimpleStorage.sol";
contract StorageFactory {
    //creating an array simpleStorageArray from the contract SimpleStorage
    SimpleStorage[] public simpleStorageArray;
    //address[] public simpleStorageArray; This will store the addresses directly and won't have the ABIs of the SimpleStorage Contract
    function createSimpleStorageContract() public {
        //creating a new instance of simple storage contract every time createSimpleStorageContract is deployed
        SimpleStorage simpleStorage = new SimpleStorage();
        //pushing the contract instance into the array
        simpleStorageArray.push(simpleStorage);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        //To interact with a contract we need.
        //Address
        //ABI - Application Binaray Interface
        simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber); //if the array wasn't of type SimpleStorage then we need to put it into the object like SimpleStorage();
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
        return simpleStorageArray[_simpleStorageIndex].retrieve();
    }
    
}
