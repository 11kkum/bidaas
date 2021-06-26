const EthCrypto = require("eth-crypto");
require('dotenv').config();
const privateKeyToPublicKey = require("ethereum-private-key-to-public-key");

const privateKey = process.env.privateKey
const publicKey:string = privateKeyToPublicKey(privateKey).toString("hex")
const message:string = "KeisukeHonda";

const messageHash = EthCrypto.hash.keccak256(message);
(async () => {
  const signature = await EthCrypto.sign(
    privateKey, // privateKey
    messageHash // hash of message
  );

  const encrypted = await EthCrypto.encryptWithPublicKey(
    publicKey, // publicKey
    message // message
  );
  const iv:string = await encrypted.iv;
  const ephemPublicKey:string = await encrypted.ephemPublicKey;
  const cipherText:string = await encrypted.ciphertext;
  const mac:string = await encrypted.mac;

  // await console.log("iv");
  // await console.log(iv);
  // await console.log("ephemPublicKey");
  // await console.log(ephemPublicKey);
  // await console.log("cipherText");
  // await console.log(cipherText);
  // await console.log("mac");
  // await console.log(mac);

  const decryptedMessage = await EthCrypto.decryptWithPrivateKey(
    privateKey, // privateKey
    {
      iv: iv,
      ephemPublicKey: ephemPublicKey,
      ciphertext: cipherText,
      mac: mac,
    } // encrypted-data
  );
  await console.log("signature:");
  await console.log(JSON.stringify(signature));
  await console.log("encrypted:");
  await console.log(JSON.stringify(encrypted));
  await console.log("decrypted");
  await console.log(decryptedMessage);
})();
