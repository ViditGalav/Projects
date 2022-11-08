// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;
contract Eventmanagment {

struct Event{
    address Manager;
    string name;
    uint date;
    uint price;
    uint ticketremaining;
    uint ticketcount;
    
    
    
    
    
}

mapping (uint=>Event) public  events;
mapping (address=>mapping(uint=>uint)) public tickets;
uint public NextID;

function createevent(string memory name,uint date,uint price,uint ticketcount)external  {
    require(date>block.timestamp,"you can organize events only for future dates..so aukat me rho");
    require(ticketcount>0,"you can organize event only if the ticketcount is more than zero");
    events[NextID]=Event(msg.sender, name,date,price, ticketcount, ticketcount);
    NextID++;
}
function buyticket(uint id,uint quantity) external payable{
require(events[id].date>0,"event does not exist");
require(events[id].date>block.timestamp,"you can organize events only for future events");
Event storage _event=events[id];

require(msg.value==(_event.price*quantity),"you have to pay a fair amounts of your ticket to participate in the event");
require(_event.ticketremaining>=quantity,"NOT enough tickets for event");
_event.ticketremaining-=quantity;
tickets[msg.sender][id]+=quantity;





}

function transferticket (uint id,uint quantity,address to) external{
require(events[id].date>0,"event does not exist");
require(events[id].date>block.timestamp,"you can organize events only for future events");
require(tickets[msg.sender][id]>=quantity,"I don't have as much tickets as much u are demanding from me");
tickets[msg.sender][id]-=quantity;
tickets[to][id]+=quantity;





}





}










