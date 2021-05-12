// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract ApprovalContract {

  address public sender;
  address payable public receiver;
  address public approver;

  constructor() public {
    // tbd
  }

  function deposit(address payable _receiver) external payable {
    require(msg.value > 0);
    sender = msg.sender;
    receiver = _receiver;
    approver = _receiver;
  }

  function viewApprover() external view returns(address) {
    return(approver);
  }

  function approve() external {
    require(msg.sender == approver);
    receiver.transfer(address(this).balance);
  }

}
