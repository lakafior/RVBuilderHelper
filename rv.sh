#!/bin/bash

WGET_PKG="wget"
WGET_OK=$(dpkg-query -W --showformat='${Status}\n' $WGET_PKG|grep "install ok installed")
NODE_PKG="nodejs-lts"
NODE_OK=$(dpkg-query -W --showformat='${Status}\n' $NODE_PKG|grep "install ok installed")
JDK_PKG="openjdk-17"
JDK_OK=$(dpkg-query -W --showformat='${Status}\n' $JDK_PKG|grep "install ok installed")

echo Checking termux-storage
if [[ ! -d ~/storage ]]; then
    echo "No termux-storage. Setting up"
	termux-setup-storage
else
	echo "Termux-stroage OK"
fi

echo Updating packages
pkg update -y

echo Checking for $WGET_PKG: $WGET_OK
if [ "" = "$WGET_OK" ]; then
  echo "No $WGET_PKG. Setting up $WGET_PKG."
  pkg install $WGET_PKG -y
fi

echo Checking for $NODE_PKG: $NODE_OK
if [ "" = "$NODE_OK" ]; then
  echo "No $NODE_PKG. Setting up $NODE_PKG."
  pkg install $NODE_PKG -y
fi

echo Checking for $JDK_PKG: $JDK_OK
if [ "" = "$JDK_OK" ]; then
  echo "No $JDK_PKG. Setting up $JDK_PKG."
  pkg install $JDK_PKG -y
fi

echo Checking if there is builder in filesystem
if [[ ! -d ~/revanced-builder-cli ]]; then
    echo "No previous builder. Setting up"
	wget https://github.com/reisxd/revanced-builder/archive/refs/heads/cli.zip
	unzip cli.zip
	cd revanced-builder-cli
	npm i
	node .
else
	echo "Builder found. Making an update"
	cp -r revanced-builder-cli/revanced ~/revanced
	rm -r revanced-builder-cli/
	rm cli.zip
	wget https://github.com/reisxd/revanced-builder/archive/refs/heads/cli.zip
	unzip cli.zip
	rm -r ~/revanced-builder-cli/revanced/
	cp -r ~/revanced ~/revanced-builder-cli/revanced
	rm -r ~/revanced/
	echo "Running builder"
	cd revanced-builder-cli
	npm i
	node .
fi





