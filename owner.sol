pragma solidity ^0.4.17;
contract Owner {

 address owner;

 modifier onlyowner() {
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
