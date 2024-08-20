// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/ERC20Token.sol";

contract ERC20TokenTest is Test {
    ERC20Token public token;
    address public owner;
    address public user;
    uint256 public constant INITIAL_SUPPLY = 1000000 ether;

    function setUp() public {
        owner = address(this);
        user = address(0x1);
        token = new ERC20Token(INITIAL_SUPPLY);
    }

    function testInitialSupply() public view {
        assertEq(token.totalSupply(), INITIAL_SUPPLY);
        assertEq(token.balanceOf(owner), INITIAL_SUPPLY);
        console.log("Initial supply minted to owner:", token.balanceOf(owner));
    }

    function testTransfer() public {
        uint256 amount = 1000 ether;
        vm.prank(owner);
        bool success = token.transfer(user, amount);
        assertTrue(success);
        assertEq(token.balanceOf(user), amount);
        assertEq(token.balanceOf(owner), INITIAL_SUPPLY - amount);
        console.log("Transferred amount:", amount);
        console.log("User balance after transfer:", token.balanceOf(user));
    }

    function testFailTransferInsufficientBalance() public {
        uint256 amount = INITIAL_SUPPLY + 1 ether;
        vm.prank(owner);
        token.transfer(user, amount);
    }

    function testApproveAndTransferFrom() public {
        uint256 amount = 500 ether;
        vm.prank(owner);
        token.approve(user, amount);
        assertEq(token.allowance(owner, user), amount);
        console.log("Approved amount:", amount);

        vm.prank(user);
        bool success = token.transferFrom(owner, user, amount);
        assertTrue(success);
        assertEq(token.balanceOf(user), amount);
        assertEq(token.balanceOf(owner), INITIAL_SUPPLY - amount);
        console.log("TransferFrom successful, new user balance:", token.balanceOf(user));
    }

    function testFailTransferFromInsufficientAllowance() public {
        uint256 approvedAmount = 100 ether;
        uint256 transferAmount = 200 ether;
        vm.prank(owner);
        token.approve(user, approvedAmount);

        vm.prank(user);
        token.transferFrom(owner, user, transferAmount);
    }
}