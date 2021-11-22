const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Vault", function () {
  let vault;

  beforeEach(async () => {
    const Vault = await ethers.getContractFactory("Vault");
    vault = await Vault.deploy();
    await vault.deployed();
  })

  it("Total Supply should start at 0", async function () {
    expect(await vault.getTotalSupply()).to.equal(0);
  });

  it("Should add supply correctly", async function () {
    await vault.add(2);
    expect(await vault.getTotalSupply()).to.equal(2);
  });

  it("Should revert if amount is higher than total supply", async function () {
    await vault.add(2);
    await expect(vault.withdraw(3)).to.be.reverted;
  });

  it("Should revert if supply amount is 0", async function () {
    await expect(vault.add(0)).to.be.reverted;
  });
});