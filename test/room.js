const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Room", function () {
  let room;

  beforeEach(async () => {
    const Room = await ethers.getContractFactory("Room");
    room = await Room.deploy();
    await room.deployed();
  })

  it("Should revert if student not found.", async function () {
    await expect(room.findStudent(26)).to.be.reverted;
  });

  it("Should not revert if student is found.", async function () {
    await room.addStudent("Nicolas", "Picardi");
    await expect(room.findStudent(1)).not.to.be.reverted;
  });

  it("Random account tries to execute onlyOwner function", async function () {
    const signers = await ethers.getSigners();
    const otherSigner = signers[1];

    await expect(room.connect(otherSigner).addStudent("Nicolas", "Picardi")).to.be.reverted;
  });
  
  it("Owner tries to execute onlyOwner function", async function () {
    const signers = await ethers.getSigners();
    const otherSigner = signers[0];

    await expect(room.connect(otherSigner).addStudent("Nicolas", "Picardi")).to.not.be.reverted;
  });
});