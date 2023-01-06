import { ethers } from 'hardhat'
import { expect } from 'chai'

describe('Casts contract tests', () => {
  before(async function () {
    this.accounts = await ethers.getSigners()
    this.owner = this.accounts[0]
    this.user = this.accounts[1]
    this.factory = await ethers.getContractFactory('Casts')
  })

  describe('Constructor', function () {
    it('should deploy the contract with the correct fields', async function () {
      const name = 'Casts'
      const symbol = 'CSTS'
      const contract = await this.factory.deploy(
        name,
        symbol,
        'https://mintit.boats/metadata/'
      )
      expect(await contract.name()).to.equal(name)
      expect(await contract.symbol()).to.equal(symbol)
    })
  })
})
