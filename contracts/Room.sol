//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Room is Ownable {
  struct Student {
    string name;
    string surname;
    bool isApproved;
    bool exists;
  }

  mapping(uint256 => Student) public students;
  event StudentAdded(uint256 id, string name, string surname);
  uint256 lastId;

  function addStudent (string memory _name, string memory _surname) public onlyOwner {
    Student memory currentStudent;
    lastId++;
    currentStudent.name = _name;
    currentStudent.surname = _surname;
    currentStudent.isApproved = false;
    currentStudent.exists = true;

    students[lastId] = currentStudent;
    emit StudentAdded(lastId, _name, _surname);
  }

  function findStudent (uint256 _id) view public returns (Student memory){
    require(students[_id].exists == true);
    return students[_id];
  }
}