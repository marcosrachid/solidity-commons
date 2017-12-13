pragma solidity ^0.4.17;

import "./mortal.sol";

contract SenderMap is Mortal {

 // key, value
 mapping(address => Permission) myAddressMapping;

 // object type
 struct Permission {
   bool isAllowed;
   uint maxBalance;
 }

 modifier is_sendable(uint amountInWei) {
   if (myAddressMapping[msg.sender].isAllowed && myAddressMapping[msg.sender].maxBalance <= amountInWei) {
     _;
   } else {
     revert();
   }
 }

 function addAddressToSenderList(address permited, uint maxTransferAmount) public only_owner {
   myAddressMapping[permited] = Permission(true, maxTransferAmount);
 }

 function sendFunds(address receiver, uint amountInWei) public is_sendable(amountInWei) {
   receiver.transfer(amountInWei);
 }

 function () public payable {}

}
