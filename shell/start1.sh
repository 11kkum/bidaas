#!/bin/sh

rm -rf find-node/test-geth/*
geth --datadir find-node/test-geth init genesis.json
geth --http --http.addr "172.16.2.81" --http.corsdomain "*" --http.port 8540 --http.api web3,eth,debug,personal,net --vmdebug --datadir find-node/test-geth --networkid 10 --allow-insecure-unlock --bootnodes "enode://6657c2f882008f4c4487e743de684f3dd8b5031241f4961ef4d84bcd79fcf497fabac3fb941ef1366775cae3e8081b5745bb14b0b19fce9e4eb41e7da7ca7bf1@172.16.2.80:0?discport=30301" --verbosity 4 console 2>> node.log
