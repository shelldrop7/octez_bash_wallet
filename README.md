## octez_bash_wallet

#### Tezos is awesome thing!

I wanted to be able to manage my Tezos independently. Without a GUI directly in the shell.
The octez-client serves as the basis and is functionally perfect.
This project uses the octez-client as an intuitive wallet from a Ubuntu bash.
Anyone can read and understand the code and adapt it to their needs.
You may need to use Ctrl-c from time to time, but it works fine.

Have fun.

</br></br>

#### Install

Ubuntu (testet Ubuntu 24.04.01 LTS)

      chmod +x octez_bash_wallet.sh
      ./octez_bash_wallet.sh
      command = install

##### Source octez-client in install
      sudo add-apt-repository -y ppa:serokell/tezos && sudo apt-get update
      sudo apt-get install -y tezos-client
      
</br></br>

#### RPC
The default Mainnet RPC can be found after installation under the following path.
You can change or point to your own node.

      path       ~/.tezos-client/config
      default    https://mainnet.ecadinfra.com
      
</br></br>

#### Import secret key
You can read the secret key from the Temple-Wallet or from Exodus-Desktop. I have tested these two Wallets.
Encrypt them with [encrypt] and then [import] them or [create] a new account.

</br></br>

#### END




