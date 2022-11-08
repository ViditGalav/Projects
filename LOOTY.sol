// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;
contract LOTTY{

address public Manager;
address payable[] public participants;

constructor() {
   Manager=msg.sender;
}
receive() external payable {
require(msg.value==1 ether);
participants.push(payable (msg.sender));
}
function getbalance() public view returns(uint) {
require(msg.sender==Manager);
return address(this).balance;
}
function random() public view returns(uint){

return uint (keccak256(abi.encodePacked(block.difficulty,block.timestamp,participants.length)));
}
function selectwinner() public view returns(address)
{
require(msg.sender==Manager);
require(participants.length>=3);
uint r=random();
uint index=r % participants.length;
address payable winner;
winner=participants[index];
return winner;

}
}

