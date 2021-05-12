const ApprovalContract = artifacts.require('../../contracts/ApprovalContract.sol');

  contract('ApprovalContract', function(accounts) {

    it('initiates contract', async function() {
      const contract = await ApprovalContract.deployed();
      const approver = await contract.approver.call();
      assert.equal(approver, 0xC5fdf4076b8F3A5357c5E395ab970B5B54098Fef, "approvers don't match");
    });

    it('takes a deposit', async function () {
      const contract = await ApprovalContract.deployed();
      await contract.deposit(accounts[0], { value: 1e+18, from: accounts[1] });
      let balance = await web3.eth.getBalance(contract.address)
      assert.equal(balance, 1e+18, "amount did not match");
    });

    it('makes the transaction when approved, approver: ' + accounts[2], async function () {
      const contract = await ApprovalContract.deployed();
      await contract.deposit(accounts[0], { value: 1e+18, from: accounts[1] });
      await contract.approve({ from: accounts[0] });
      let balance = await web3.eth.getBalance(contract.address)
      assert.equal(balance, 0, "didn't transfer ether");
    });

  });
