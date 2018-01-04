pragma solidity ^0.4.17;

import "./owner.sol";

contract SenderMap is Owner {

 // key, value
 mapping(address => Permission) myAddressMapping;

 // object type
 struct Permission {
   bool isAllowed;
   uint maxBalance;
 }

 modifier is_sendable(uint amountInWei) {
   require(myAddressMapping[msg.sender].isAllowed);
   require(myAddressMapping[msg.sender].maxBalance >= amountInWei);
 }

 function addAddressToSenderList(address permited, uint maxTransferAmount) public only_owner {
   myAddressMapping[permited] = Permission(true, maxTransferAmount);
 }

 function removeAddressFromSendersList(address theAddress) public only_owner {
   delete myAddressMapping[theAddress];
 }

 function sendFunds(address receiver, uint amountInWei) public is_sendable(amountInWei) {
   receiver.transfer(amountInWei);
 }

 function () public payable {}

}
