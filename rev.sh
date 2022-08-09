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
read -p "Enter type (cli/main): " type

if ! [[ "$type" == "cli" || "$type" == "main" ]]; then
 echo "Invalid type"
 exit 1
fi

BACKUP_DIR="$HOME/revanced"
BUILDER_DIR="$HOME/revanced-builder-$type"
FILE="$type.zip"
URL="https://github.com/reisxd/revanced-builder/archive/refs/heads/$FILE"

if [ -d "$BUILDER_DIR" ]; then
 echo "Builder found. Making an update"
 cp -r "$BUILDER_DIR/revanced" "$BACKUP_DIR"
 rm -r $BUILDER_DIR
 rm -f $FILE

 wget $URL
 unzip $FILE

 rm -r "$BUILDER_DIR/revanced"
 cp -r "$BACKUP_DIR" "$BUILDER_DIR/revanced"
 rm -r "$BACKUP_DIR"
 echo "Update finished"
else
 wget $URL
 unzip $FILE
fi

echo "Running builder"
cd "$BUILDER_DIR" && npm i && node .