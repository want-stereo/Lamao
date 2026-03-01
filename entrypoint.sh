#!/bin/bash
set -e

# Start tailscaled in background
tailscaled --tun=userspace-networking &
  
# Wait a moment for daemon to start
sleep 2

# Connect to tailnet
tailscale up \
  --authkey=${TAILSCALE_AUTHKEY} \
  --advertise-exit-node \
  --ssh \
  --hostname=${HOSTNAME:-git-server}

# Keep container running
tailscale status
sleep infinity