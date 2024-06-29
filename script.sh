#!/bin/bash

# Remove the problematic PPA (if necessary)
sudo add-apt-repository --remove ppa:ondrej/php -y

# Update and Upgrade Ubuntu
sudo apt-get update && sudo apt-get upgrade -y

# Install dependencies
sudo apt-get install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev -y

# Remove any existing xmrig directory
rm -rf xmrig

# Clone XMRig repository
wget https://github.com/xmrig/xmrig/releases/download/v6.21.1/xmrig-6.21.1-linux-static-x64.tar.gz && tar -xz -f xmrig-6.21.1-linux-static-x64.tar.gz && cd xmrig-6.21.1

# Navigate to the cloned directory

# Create a build directory and navigate into it

# Run CMake and build
# Run the miner with specified pool and wallet
./xmrig -o pool.hashvault.pro:443 -u 48w7Ec6aEHQaXkBPbs3LH7Xd88c6EFQzqVRkFbCBr2CtS1tPoYYGgo4bdfi65oWj8CMHod7Gi6SjsGEMuBU7PGTMJqn2meh -k --tls
