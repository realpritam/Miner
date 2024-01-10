#!/bin/bash

# Remove the problematic PPA (if necessary)
sudo add-apt-repository --remove ppa:ondrej/php -y

# Update and Upgrade Ubuntu
sudo apt-get update && sudo apt-get upgrade -y

# Install dependencies
sudo apt-get install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev -y

# Remove any existing xmrig directory

# Clone XMRig repository
git clone https://github.com/xmrig/xmrig.git

# Navigate to the cloned directory
cd xmrig

# Create a build directory and navigate into it
mkdir build && cd build

# Run CMake and build
cmake ..
make

# Run the miner with specified pool and wallet
./xmrig -o pool.hashvault.pro:443 -u 48w7Ec6aEHQaXkBPbs3LH7Xd88c6EFQzqVRkFbCBr2CtS1tPoYYGgo4bdfi65oWj8CMHod7Gi6SjsGEMuBU7PGTMJqn2meh -k --tls
