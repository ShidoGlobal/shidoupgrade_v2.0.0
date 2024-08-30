#!/bin/bash

# Check if the script is run as root
#if [ "$(id -u)" != "0" ]; then
#  echo "This script must be run as root or with sudo." 1>&2
#  exit 1
#fi


# Get OS and version
OS=$(awk -F '=' '/^NAME/{print $2}' /etc/os-release | awk '{print $1}' | tr -d '"')
VERSION=$(awk -F '=' '/^VERSION_ID/{print $2}' /etc/os-release | awk '{print $1}' | tr -d '"')

# Define the binary and installation paths
BINARY="shidod"

# Set dedicated home directory for the shidod instance
 HOMEDIR="/data/.tmp-shidod"
echo "export DAEMON_NAME=shidod" >> ~/.profile
echo "export DAEMON_HOME="$HOMEDIR"" >> ~/.profile
source ~/.profile
echo $DAEMON_HOME
echo $DAEMON_NAME

# Check if the OS is Ubuntu and the version is either 20.04 or 22.04
if [ "$OS" == "Ubuntu" ] && [ "$VERSION" == "20.04" -o "$VERSION" == "22.04" ]; then
  # Copy and set executable permissions
  current_path=$(pwd)
  sudo chmod +x "$current_path/ubuntu${VERSION}build/$BINARY"
  cosmovisor add-upgrade v2.0.0 "$current_path/ubuntu${VERSION}build/$BINARY"
  
else
  echo "Please check the OS version support; at this time, only Ubuntu 20.04 and 22.04 are supported."
  exit 1
fi





