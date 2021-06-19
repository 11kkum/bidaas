const privateKeyToAddress = require('ethereum-private-key-to-address')
const privateKeyToPublicKey = require('ethereum-private-key-to-public-key')

const priKey = ''

console.log("public key")
console.log(privateKeyToPublicKey(priKey).toString('hex'))
console.log("address")
console.log(privateKeyToAddress(priKey))
