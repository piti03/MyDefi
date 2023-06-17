const Tether = artifacts.require('Tether');
const RWD = artifacts.require('RWD');
const DecentralizedBank = artifacts.require('DecentralizedBank');



module.exports = async function (deployer,network, accounts){
    // accounts refer to the ganache

    await deployer.deploy(Tether);
    const tether = await Tether.deployed();


    await deployer.deploy(RWD);
    const rwd = await RWD.deployed();


    await deployer.deploy(DecentralizedBank,rwd.address,tether.address);
    const decentralizedBank = await DecentralizedBank.deployed();
    

    // Transfer RWD tokens to D_BANK
    await rwd.transfer(decentralizedBank.address,'1000000000000000000000000');
    await tether.transfer(accounts[1],'1000000000000000000');
}