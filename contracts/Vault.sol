//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Vault {
	uint256 private totalSupply;

	function add(uint256 amount) public {
		require(amount > 0, "Amount must be more than 0.");
		totalSupply += amount;
	}

	function withdraw(uint256 amount) public {
		require(amount > 0, "Amount must be more than 0.");
		require(amount <= totalSupply, "Amount must be less than or equal to total supply.");
		totalSupply -= amount;
	}

	function getTotalSupply() public view returns (uint256) {
		return totalSupply;
	}
}