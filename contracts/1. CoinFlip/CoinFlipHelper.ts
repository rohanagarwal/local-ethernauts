import { expect } from "chai";
import { ethers } from "hardhat";

const helper = async (victim: any, attacker: any) => {
  // run the logic in attacker, get result, then call victim with the known result
  // do this in a loop 10 times!
  for (let i = 0; i < 10; i++) {
    await attacker.hackContract();
  }
};

export default helper;
