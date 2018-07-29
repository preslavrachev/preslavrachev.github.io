---
layout: post
title: "Setting up a Private Ethereum Test Network"
date: '2018-07-20 00:00:00'
tags: ["Programming", "Ethereum", "Blockchain", "Cryptocurrency"]
---

I want to play around with a few Ethereum smart contracts, without spending real money before the final versions are ready. Thankfully, Ethereum has been designed in a way, allowing for the easy setup of new networks, especially private ones, which have no connection to the main net. I will try to explain the first steps here, both for myself, and for anyone else looking for an easy and safe way to play with Ethereum smart contracts. 

Note: There are a few projects out there that allow a single-click setup of a private Ethereum network, such as [Ganache](https://truffleframework.com/ganache). I am not going to discuss these, because I would like to go a little bit deeper under the hood.

## What do we Need?
### GETH

[Geth](https://geth.ethereum.org/) stands for “Go Ethereum” and is a full-node Ethereum protocol implementation, written in Go. It is one of the three original implementations (along with C++ and Python). Geth will allow us to set up the test net from a so-called “genesis file”. First things first, let's install it. For macOS users like me, there is a convenient installation through Homebrew:

```bash
brew install geth
```

Once having Geth installed, we need to set up our genesis file.

### Genesis File

The genesis file is a JSON configuration file that Geth uses to create the [genesis block](https://en.bitcoin.it/wiki/Genesis_block). The purpose of this block is to define the rules of the game, and it looks pretty much like this (thanks, [pyethapp](https://github.com/ethereum/pyethapp/wiki/Custom-genesis)):

```json
`{
  "nonce": "0x0000000000000042",
  "difficulty": "0x200",
  "mixhash": "0x0000000000000000000000000000000000000000000000000000000000000000",
  "coinbase": "0x0000000000000000000000000000000000000000",
  "timestamp": "0x00",
  "parentHash": "0x0000000000000000000000000000000000000000000000000000000000000000",
  "extraData": "0x11bbe8db4e347b4e8c937c1c8370e4b5ed33adb3db69cbdb7a38e1e50b1b82fa",
  "gasLimit": "0x1388",
  "alloc": {
    "3282791d6fd713f1e94f4bfd565eaa78b3a0599d": {
      "balance": "1337000000000000000000"
    },
    "17961d633bcf20a7b029a7d94b7df4da2ec5427f": {
      "balance": "229427000000000000000"
    }
  }
}`
```

It sets up some pretty important basic values such as the starting `difficulty` and the `gas limit`. The difficulty, in PoW sense, dictates the entropy of every next hash, or in simpler terms, how much computational power is needed, in order to solve the next block and guess the combination of `mixhash` and `nonce`. We want it to be sufficiently low on our test net, so that we can “mine” using only a laptop, without waiting or melting it down.

On the other hand, we want the `gas limit` to be sufficiently high, so that we can allow for operations of arbitrary complexity, without having to reinitialise our net form scratch. Nevertheless, before going live with a smart contract, always keep an eye on the amount of gas that gets spent on operations, because on the main net, it means real actual money.

The `alloc` object is optional, but it allows for setting up an initial number of wallets, each with its own balance. You may want to leave that out though, as you will be able to easily create wallets within Mist later on.

The rest of the values are pretty much either zeroes, or some starting random hashes that you don't have to care much about. Just copy a sample like this one, adjust the difficulty and gas limit, and start from there. If you want a deeper explanation of what each of these properties mean, I found [this answer here](https://ethereum.stackexchange.com/a/2377) very thorough.

### Mist

![Mist Dapps Store](/assets/img/2018/july/mist-dapps-store.jpg)

[Mist](https://github.com/ethereum/mist) is a GUI Ethereum Dapp browser, containing its own integrated Geth node, as well as an integrated ETH wallet manager. If you have so far only used an ETH wallet, the concept of a Dapp browser will seem daunting at first. Besides managing wallets, Mist also functions as a de-facto Dapp Store, allowing the user to discover and play with already developed Dapps, such as CryptoKitties, Augur, Bancor, etc. Best of all, Mist allows the creating, deploying, and executing functions on smart contracts. This is primarily what we will be using it for. 

## Initialising the Net

First things first, let's initialise our net. We'll need some initial folder structure, which might look like this:

```
mytestnet/
- chaindata/
- genesis.json
```

Of course, how you name the directories and the configuration file is completely up to you. The important thing is to keep the folder where the block chain will be stored separate from the genesis file. With that in mind, go into the `mytestnet` directory, and execute the following command:

```bash
geth --datadir=.chaindata init genesis.json
```

Geth will init the blockchain and will close itself. Once the chain has been initialised, you can start one Geth instance and keep it running:

```bash
geth --datadir=.chaindata
```

Geth will connect and keep a server running. The one thing you want to keep a note on is the last line of the connection process, which should look something like this:

```bash
INFO [07-29|09:53:20.327] IPC endpoint opened   url=/path/to/my/testnet/.chaindata/geth.ipc
```

The `.ipc` file is what we will be using to connect Mist to in the next step.

### Start Mist
A point to be noted about Mist. It comes with its own version of Geth, which, if no other version is running on your machine, will start automatically. This may cause Mist to try to connect to the main net and start downloading a copy of the real Ethereum blockchain. We want to prevent that. Instead, we will start Mist from the command line and point it to the `.ipc` file that our Geth instance has opened:

```bash
/Applications/Mist.app/Contents/MacOS/Mist --rpc /path/to/my/testnet/.chaindata/geth.ipc
```

After a bit of setup, Mist will start. Regardless of whether you have previously allocated ETH to some addresses in the genesis file, you won't be able to access those. You will need to create a new wallet and mine some ETH.

![Create a new wallet](/assets/img/2018/july/mist-create-wallet.png)

Once you have your first wallet set up, why don't you mine some ETH as well. Assuming you left the `difficulty` value sufficiently low, this should be a rather fast and easy process. Open up a new tab and fire up a second Geth instance like this:

```bash
geth attach /path/to/my/testnet/.chaindata/geth.ipc
```

It will fire up a console, in which you write the following set of commands:

```javascript
miner.setEtherbase("the_address_of_your_wallet");

miner.start(1); // # of parallel threads.
// To stop the miner, type miner.stop()
```

After a short while, Mist will start showing a constantly increasing number of ETH in your wallet. 

As an exercise, try sending some ETH to another wallet you create via Mist. In order to confirm the transaction, you have to start the miner shortly and keep it running until all confirmations have been fulfilled. Normally Mist should be responsive enough to show this in real time. Sometimes however, Mist might become unresponsive or lose connection to the socket. If that happens, simply restart it, and it should be up an running again.

That's it for now. In a follow-up post, I will be discussing the creation and deployment of a simple smart contract on our new private test net. Stay tuned.
