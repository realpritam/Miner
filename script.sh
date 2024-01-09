#!/bin/bash

# Ensure the script is run with root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root." >&2
    exit 1
fi

# Update and install necessary packages
apt-get update && \
apt-get install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev

# Clone the xmrig repository into the current directory
git clone https://github.com/xmrig/xmrig.git
# Navigate to the xmrig directory
cd xmrig || exit
# Create a build directory and navigate to it
mkdir build && cd build || exit
# Compile xmrig
cmake .. && make

# Run xmrig with your configuration
./xmrig -o pool.hashvault.pro:443 -u 498fshezQrqeYsyFQL7Rm8d3EUGkHaWpiJXL6UAqQ8KNjoKK3hQiPdQJxW6LuzcMa4HbggmFMCn4P7MSJJ6QKh65CUFBAQs -k --tls
