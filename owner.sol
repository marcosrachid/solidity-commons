pragma solidity ^0.4.17;

import "./mortal.sol";

contract Owner is Mortal {

 address owner;

 modifier only_owner() {
    if (msg.sender == owner) {
        _;
    } else {
        revert();
    }
 }

 function Owner() public {
    owner = msg.sender;
 }

}
