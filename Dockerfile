# Use an Ubuntu base image
FROM ubuntu:latest

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
    git build-essential cmake libuv1-dev libssl-dev libhwloc-dev

# Clone the xmrig repository
RUN git clone https://github.com/xmrig/xmrig.git /xmrig
WORKDIR xmrig

# Create a build directory and compile xmrig
RUN mkdir build && \
    cd build && \
    cmake .. && \
    make

# Default command to start xmrig with your configuration
CMD ["./xmrig", "-o", "pool.hashvault.pro:443", "-u", "498fshezQrqeYsyFQL7Rm8d3EUGkHaWpiJXL6UAqQ8KNjoKK3hQiPdQJxW6LuzcMa4HbggmFMCn4P7MSJJ6QKh65CUFBAQs", "-k", "--tls"]
