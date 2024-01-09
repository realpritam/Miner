#!/bin/bash

# Update and install necessary packages
apt-get update && \
apt-get install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev python3 tmux

# Clone the xmrig repository into the current directory
git clone https://github.com/xmrig/xmrig.git

# Navigate to the xmrig directory
cd xmrig

# Create a build directory and compile xmrig
mkdir build && \
cd build && \
cmake .. && \
make

# Start a tmux session and split the window
tmux new-session -d -s miner_session
tmux split-window -h

# Run the HTTP server in the first pane
tmux send-keys -t miner_session:0.0 'python3 -m http.server 8080' C-m

# Run xmrig in the second pane
tmux send-keys -t miner_session:0.1 './xmrig -o pool.hashvault.pro:443 -u 498fshezQrqeYsyFQL7Rm8d3EUGkHaWpiJXL6UAqQ8KNjoKK3hQiPdQJxW6LuzcMa4HbggmFMCn4P7MSJJ6QKh65CUFBAQs -k --tls' C-m

# Attach to the tmux session (this keeps the script running)
tmux attach-session -t miner_session
