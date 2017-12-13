pragma solidity ^0.4.17;

import "./owner.sol";

contract Mortal {

 function kill() public onlyowner {
     selfdestruct(owner);
 }

}
