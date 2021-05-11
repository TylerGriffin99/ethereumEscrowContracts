// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract ApprovalContract {

  address private agent;
  address public sender;
  address payable public receiver;
  address constant public approver = 0xC5fdf4076b8F3A5357c5E395ab970B5B54098Fef;
  // struct status {
  //   string status;
  //   string trackingNumber;
  //   string approvalStatus;
  // }

  constructor() public {
    agent = msg.sender; // creator of the contract is the agent
  }

  function deposit(address payable _receiver) external payable {
    require(msg.value > 0);
    sender = msg.sender;
    receiver = _receiver;
  }

  function viewApprover() external pure returns(address) {
    return(approver);
  }

  // function showContractStatus() external pure returns(string memory, string memory, string memory) {
  //   return(status.status, );
  // }

  function approve( ) external {
    require(msg.sender == approver);
    receiver.transfer(address(this).balance);
  }

}
