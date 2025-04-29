// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundMeTest is Test {
    FundMe fundMe; //Declare new instancecalled fundMe

    function setUp() public {
        fundMe = new FundMe(); //Deploy new FundMe contract
    }

    function testMinimumDollarIsFive() public view {
        assertEq(fundMe.MINIMUM_USD(), 5); // Check if the minimum dollar amount is 5
    }

    function testOwnerIsMsgSender() public view {
        assertEq(fundMe.i_owner(), msg.sender); // Check if the owner is the message sender
    }

}