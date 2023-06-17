const { assert } = require('chai');

const RWD = artifacts.require('RWD');
const Tether = artifacts.require('Tether');
const DecentralizedBank = artifacts.require('DecentralizedBank');

require('chai').should()



contract('DecentralizedBank',(accounts) => {
    function invertedTokens(number){
        return web3.utils.toWei(number, 'Eth');}
    const sampleToken = '1000000000000000000000000' ;   


    let tether, rwd, decentralBank
    before(async()=>{
         tether = await Tether.new()
         rwd =     await RWD.new()
         decentralBank = await DecentralizedBank.new(rwd.address, tether.address)

         // Transfer all tokens to decentralBank : 1 milion
        await rwd.transfer(decentralBank.address, sampleToken)

        // Transfer Tether to customer 
        await tether.transfer(accounts[1], sampleToken, {from: accounts[0]})


    })



    describe('Mock Tether', async() => {
        it('matches name correctly' , async() => {
            
            const name = await tether.name()
            assert.equal( name, 'Mock Tether')

        })
    })

    describe('Reward Token', async()=>{
        it('matches name correctly', async()=>{
            
            const name =  await rwd.name()
            assert.equal(name, 'Reward Token')
        })
    })

    describe('decentral Bank', async()=>{
        it('matches name correctly' , async()=>{
            const name = await  decentralBank.name()
            assert.equal(name, 'decentral Bank')
        })

        it('contract tokens', async()=>{
            let balance = await rwd.balanceOf[decentralBank.address]
            assert.equal(balance , sampleToken)
        })
    })


  

});


