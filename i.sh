#!/bin/bash

# Settings 
LINUX_MINT_URL="https://mirrors.edge.kernel.org/linuxmint/stable/21.1/linuxmint-21.1-cinnamon-64bit.iso" 
LINUX_MINT_ISO="linuxmint-21.1-cinnamon-64bit.iso" 
VM_DISK_IMAGE="linuxmint.qcow2"  
VM_RAM="2048"                     
NGROK_AUTHTOKEN="1zJkm6j2hhivdl25BtPGSAw2OAz_6HXjedjZN6drDzadRUovm" 
NGROK_PORT="22"                   

# Download Linux Mint ISO (if not present)
if [ ! -f "$LINUX_MINT_ISO" ]; then
    echo "Linux Mint ISO not found. Downloading..."
    wget $LINUX_MINT_URL
fi

# Create a virtual disk image (if it doesn't exist)
if [ ! -f "$VM_DISK_IMAGE" ]; then
    qemu-img create -f qcow2 "$VM_DISK_IMAGE" 10G 
fi

# Start the QEMU virtual machine
qemu-system-x86_64 \
    -cdrom "$LINUX_MINT_ISO" \
    -hda "$VM_DISK_IMAGE" \
    -m "$VM_RAM" \
    -enable-kvm \
    -net nic,model=virtio \
    -net user,hostfwd=tcp::5555-:22  

# Install and start ngrok 
curl -sSL https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.tgz | tar xvz
./ngrok 1zJkm6j2hhivdl25BtPGSAw2OAz_6HXjedjZN6drDzadRUovm
./ngrok tcp $NGROK_PORT  
