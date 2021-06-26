const privateKeyToAddress = require("ethereum-private-key-to-address");
const privateKeyToPublicKey = require("ethereum-private-key-to-public-key");
const publicKeyToAddress = require("ethereum-public-key-to-address");
require("dotenv").config();

const privateKey = process.env.privateKey;

console.log("private key");
console.log(privateKey);
console.log("private ket to public key");
const pubKey = privateKeyToPublicKey(privateKey).toString("hex");
console.log(privateKeyToPublicKey(privateKey).toString("hex"));
console.log("public key to address");
console.log(publicKeyToAddress(pubKey));
console.log("private key to address");
console.log(privateKeyToAddress(privateKey));
