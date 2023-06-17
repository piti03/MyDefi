const Migration = artifacts.require('Migration');
const RWD = artifacts.require('RWD');
const DecentralizedBank = artifacts.require('DecentralizedBank');
const Tether = artifacts.require('Tether')


module.exports = function (deployer){
    // Deploy migration
    
    deployer.deploy(Migration);

    //Deploy Bank
    //deployer.deploy(DecentralizedBank);
    
    //Deploy RWD
    deployer.deploy(RWD);

    deployer.deploy(Tether);
};

