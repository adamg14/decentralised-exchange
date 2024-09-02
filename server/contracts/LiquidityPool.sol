// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// import the interface of an ERC token so functions can be called from it
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract LiquidityPool{
    address public AdamTokenAddress;
    uint256 public LPETHAmount;

    constructor(address adamTokenAddress) payable{
        AdamTokenAddress = adamTokenAddress;
        LPETHAmount = address(this).balance;
    }

    function initialLiquidityPoolFund(address sender, uint256 amount) public payable{
        IERC20 AdamToken = IERC20(AdamTokenAddress);

        require(AdamToken.transferFrom(sender, address(this), amount));
    }

}