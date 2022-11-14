// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;
contract   crowdFunding {

address public Manager;
mapping(address=> uint) public contributors;
uint public deadline;
uint public minimalcontribution;
uint public Target;
uint public raisedammount;
uint public noofcontributors;

struct Request{
string description;
address payable recipient;
uint value;
bool completed;
uint noofVoters;
mapping(address=>bool)voters;
}
constructor(uint _target , uint _deadline) {
    Target=_target;
    deadline=block.timestamp +_deadline;// 10 sec. + 3600 sec. (60*60)
    minimalcontribution=100 wei;
    Manager=msg.sender;

}
function Sendeth () public payable  {
    require(block.timestamp<deadline, "Deadline has passed");
    require(msg.value>= minimalcontribution,"Minimum Contribution is not met");

    if (contributors[msg.sender]==0) {
        noofcontributors++;
        }
        
        contributors[msg.sender]+= msg.value;
        raisedammount+=msg.value;


}

function getcontractbalance() public view returns (uint){
return address(this).balance;


}
function Refund() public{
require(block.timestamp>deadline && raisedammount<Target,"you are unable to reach the goals for this Crowdfunding");
require(contributors[msg.sender]>0);
address payable user=payable(msg.sender);
user.transfer(contributors[msg.sender]);
contributors[msg.sender]=0;


}

modifier onlyManager(){
require(msg.sender==Manager,"ONLY Manager can call this function");
_;


}

function createrequest(string memory _description , address payable _recipient , uint _value) public onlyManager {
    Request storage newRequest=requests[numrequests];
}
}