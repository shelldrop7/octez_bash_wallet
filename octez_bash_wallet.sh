#!/usr/bin/env bash
#
#   Octez Bash Wallet
#
#		Ubuntu apt bash version
#
#			chmod				chmod +x octez_bash_wallet.sh
#
#			run				./octez_bash_wallet.sh
#
#			Accounts			~/.tezos-client/<files>
#
#			RPC default		https://mainnet.ecadinfra.com
#								config ~/.tezos-client/config
#
#


# Vars
	title="Octez Bash Wallet"
	feecap="--fee-cap 1.0"
	burncap="--burn-cap 1.0"


# Functions
   install_wallet() {
		clear
		echo -e -n "\n\n\t$title"
		echo -e -n "\n\n\n\t\tInstall Wallet (octez-client for Ubuntu apt)\n\n\n"
		bash -c "sudo add-apt-repository -y ppa:serokell/tezos && sudo apt-get update"
		bash -c "sudo apt-get install -y tezos-client"
		bash -c "octez-client --endpoint https://mainnet.ecadinfra.com config update"
		read dummy
		clear
		navi
   }

   encrypt_key() {
		clear
		echo -e -n "\n\n\t$title"
		echo -e -n "\n\n\n\t\tEncrypt unencrypted secret key (format edsk...)\n\n\n"
		bash -c "octez-client encrypt secret key"
		read dummy
		clear
		navi
   }

   import_key() {
		clear
		echo -e -n "\n\n\t$title"
		echo -e -n "\n\n\n\t\tImport secret key (format encrypted:edsk...)\n\n"
		echo -e -n "\n\t\tAccount = "
		read account
		echo -e -n "\n\t\tSecret Key = "
		read secret_key
		bash -c "octez-client import secret key $account $secret_key"
		read dummy
		navi
   }

   create_account() {
		clear
		echo -e -n "\n\n\t$title"
		echo -e -n "\n\n\n\t\tCreate new account\n\n"
		echo -e -n "\n\t\tAccount name = "
		read account
		bash -c "octez-client gen keys $account"
		read dummy
		navi
   }

   address_show() {
		clear
		echo -e -n "\n\n\t$title"
		echo -e -n "\n\n\n\t\tShow address from <account>\n\n"
		echo -e -n "\n\t\tAccount = "
		read account
		bash -c "octez-client show address $account"
		read dummy
		clear
		navi
   }

   balance() {
		clear
		echo -e -n "\n\n\t$title"
		echo -e -n "\n\n\n\t\tBalance from <account>\n\n"
		echo -e -n "\n\t\tAccount = "
		read account
		bash -c "octez-client get balance for $account"
		read dummy
		clear
		navi
   }

   transfer() {
		clear
		echo -e -n "\n\n\t$title"
		echo -e -n "\n\n\n\t\tTransfer <amount> from <account> to <account|address>\n\n"
		echo -e -n "\n\t\tAmount \$xtz = "
		read amount
		echo -e -n "\n\t\tFrom Account = "
		read account
		echo -e -n "\n\t\tTo Recipient = "
		read recipient
		bash -c "octez-client transfer $amount from $account to $recipient $feecap $burncap"
		read dummy
		clear
		navi
   }

   delegate_show() {
		clear
		echo -e -n "\n\n\t$title"
		echo -e -n "\n\n\n\t\tShow delegate address from <account>\n\n"
		echo -e -n "\n\t\tAccount = "
		read account
		bash -c "octez-client get delegate for $account"
		read dummy
		clear
		navi
   }

   delegate_start() {
		clear
		echo -e -n "\n\n\t$title"
		echo -e -n "\n\n\n\t\tStart delegate for <account> to <address>\n\n"
		echo -e -n "\n\t\tAccount = "
		read account
		echo -e -n "\n\t\tAddress = "
		read address
		bash -c "octez-client set delegate for $account to $address"
		read dummy
		clear
		navi
   }

   delegate_stop() {
		clear
		echo -e -n "\n\n\t$title"
		echo -e -n "\n\n\n\t\tStop delegate for <account>\n\n"
		echo -e -n "\n\t\tAccount = "
		read account
		bash -c "octez-client withdraw delegate from $account"
		read dummy
		clear
		navi
   }

	stake_balance() {
		clear
		echo -e -n "\n\n\t$title"
		echo -e -n "\n\n\n\t\tShow stake balance for <account>\n\n"
		echo -e -n "\n\t\tAccount = "
		read account
		bash -c "octez-client get staked balance for $account"
		read dummy
		clear
		navi
	}

	stake() {
		clear
		echo -e -n "\n\n\t$title"
		echo -e -n "\n\n\n\t\tStake <amount> for <account>\n\n"
		echo -e -n "\n\t\tAmount \$xtz = "
		read amount
		echo -e -n "\n\t\tAccount = "
		read account
		bash -c "octez-client stake $amount for $account"
		read dummy
		clear
		navi
	}

	unstake() {
		clear
		echo -e -n "\n\n\t$title"
		echo -e -n "\n\n\n\t\tUnstake <amount> for <account>\n\n"
		echo -e -n "\n\t\tAmount \$xtz = "
		read amount
		echo -e -n "\n\t\tAccount = "
		read account
		bash -c "octez-client unstake $amount for $account"
		read dummy
		clear
		navi
	}

	finalize() {
		clear
		echo -e -n "\n\n\t$title"
		echo -e -n "\n\n\n\t\tFinalize unstake all for <account>\n\n"
		echo -e -n "\n\t\tAccount = "
		read account
		bash -c "octez-client finalize unstake for $account"
		read dummy
		clear
		navi
	}


# Navi Head
	navi() {
	clear
	echo -e -n "\n\n\t$title"

	echo -e -n "\n\n\n\t\t[install] Install Wallet (octez-client for Ubuntu apt)"
	echo -e -n "\n\t\t[encrypt] Encrypt unencrypted secret key"
	echo -e -n "\n\t\t[import] Import encrypt secret key"
	echo -e -n "\n\t\t[create] Create new <account>"

	echo -e -n "\n\n\t\t[a] Show address from <account>"
	echo -e -n "\n\t\t[b] Balance from <account>"
	echo -e -n "\n\t\t[t] Transfer from <account> to <account|address>"

	echo -e -n "\n\n\t\t[da] Show delegate address from <account>"
	echo -e -n "\n\t\t[dt] Start delegate for <account> to <address>"
	echo -e -n "\n\t\t[ds] Stop delegate for <account>"

	echo -e -n "\n\n\t\t[sb] Show stake balance for <account>"
	echo -e -n "\n\t\t[s] Stake <amount> for <account>"
	echo -e -n "\n\t\t[u] Unstake <amount> for <account>"
	echo -e -n "\n\t\t[f] Finalize unstake for <account>"


# Navi Case
	echo -e -n "\n\n\n\tcommand = "
	read input
	case "$input" in

		install) install_wallet;;
		encrypt) encrypt_key;;
		import) import_key;;
		create) create_account;;

		a) address_show;;
		b) balance;;
		t) transfer;;

		da) delegate_show;;
		dt) delegate_start;;
		ds) delegate_stop;;

		sb) stake_balance;;
		s) stake;;
		u) unstake;;
		f) finalize;;

		*) clear;;
   esac
	}
	navi


# END
#
#


