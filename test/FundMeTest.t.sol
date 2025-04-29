// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundMeTest is Test {
    FundMe fundMe; //Declare new instance called fundMe

    function setUp() public {
        fundMe = new FundMe(); //Deploy new FundMe contract
        console.log("GM");
    }

    function testMinimumDollarIsFive() public view {
        assertEq(fundMe.MINIMUM_USD(), 5); // Check if the minimum dollar amount is 5
    }

    function testOwnerIsMsgSender() public view {
        console.log(msg.sender);
        console.log(address(this));
        //assertEq(fundMe.i_owner(), msg.sender); // Check if the owner is the message sender, msg.sender is the address that deploys the contract
        assertEq(fundMe.i_owner(), address(this)); // Check if the owner is the address of this contract
    }

    function testPriceFeedVersionIsAccurate() public view {
        console.log("Version");
        uint256 version = fundMe.getVersion();
        assertEq(version, 4); // Check if the price feed version is 4
    }
}