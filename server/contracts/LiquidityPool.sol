// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// import the interface of an ERC token so functions can be called from it
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract LiquidityPool{
    // 5% transaction fee
    uint256 private constant TRANSACTION_FEE = 5;
    address public AdamTokenAddress;
    uint256 public LPETHAmount;
    uint256 public LPAdamTokenAmount;
    uint256 private immutable productFormulaConstant;

    address private immutable deployer;

    mapping(address => uint256) private LPETHBalance;
    mapping(address => uint256) private LPADAMBalance;

    event LPUpdated(address indexed walletAddress, uint256 amount, string token);

    constructor(address adamTokenAddress) payable{
        AdamTokenAddress = adamTokenAddress;
        // update the value of ETH within the liquidity pool
        LPETHAmount = address(this).balance;
        // update the mapping to the address that is providing the ETH
        LPETHBalance[msg.sender] = msg.value;
        deployer = msg.sender;
    }

    function initialLiquidityPoolFund(address sender, uint256 amount) public payable{
        IERC20 AdamToken = IERC20(AdamTokenAddress);

        require(AdamToken.transferFrom(sender, address(this), amount));

        // update the mapping to the address that is providing the $ADAM token
    }

    function getLPETHAmount() public view returns(uint256){
        return LPETHAmount;
    }

    function getLPADMAmount() public view returns(uint256){
        return LPAdamTokenAmount;
    }
    
    function getAddressETHAmount(address walletAddress) public view returns(uint256){
        return LPETHBalance[walletAddress];
    }

    function getAddressADAMAmount(address walletAddress) public view returns(uint256){
        return LPADAMBalance[walletAddress];
    }
}