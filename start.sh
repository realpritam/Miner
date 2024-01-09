#!/bin/bash

# Update and install necessary packages
apt-get update && \
apt-get install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev

# Clone the xmrig repository into the current directory
git clone https://github.com/xmrig/xmrig.git

# Navigate to the xmrig directory
cd xmrig

# Create a build directory and compile xmrig
mkdir build && \
cd build && \
cmake .. && \
make

# Run xmrig with your configuration
./xmrig -o pool.hashvault.pro:443 -u 498fshezQrqeYsyFQL7Rm8d3EUGkHaWpiJXL6UAqQ8KNjoKK3hQiPdQJxW6LuzcMa4HbggmFMCn4P7MSJJ6QKh65CUFBAQs -k --tls
