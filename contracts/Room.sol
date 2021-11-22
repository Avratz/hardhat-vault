//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Room {
  struct Student {
    //uint256 id;
    string name;
    string surname;
    bool isApproved;
    bool exists;
  }

  //Students[] students; //bad solution with array. 
  mapping(uint256 => Student) public students;
  uint256 lastId;

  function addStudent (string memory _name, string memory _surname) public {
    Student memory currentStudent;
    lastId++;
    //currentStudent.id = lastId;
    currentStudent.name = _name;
    currentStudent.surname = _surname;
    currentStudent.isApproved = false;
    currentStudent.exists = true;

    //students.push(currentStudent);
    students[lastId] = currentStudent;
  }

  function findStudent (uint256 _id) view public returns (Student memory){
    require(students[_id].exists == true);
    return students[_id];
    /* bad solution with array. 
    for (uint256 i = 0; i < students.length; i++) {
      if(students[i].id == _id) {
        return students[i];
      }
    }*/
  }
}