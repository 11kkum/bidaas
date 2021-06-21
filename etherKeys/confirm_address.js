const privateKeyToAddress = require("ethereum-private-key-to-address");
const privateKeyToPublicKey = require("ethereum-private-key-to-public-key");
const publicKeyToAddress = require("ethereum-public-key-to-address");

const priKey = "";

console.log("private ket to public key");
const pubKey = privateKeyToPublicKey(priKey).toString("hex");
console.log(privateKeyToPublicKey(priKey).toString("hex"));
console.log("public key to address");
console.log(publicKeyToAddress(pubKey));
console.log("private key to address");
console.log(privateKeyToAddress(priKey));
