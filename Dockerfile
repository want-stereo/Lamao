FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y curl && \
    curl -fsSL https://tailscale.com/install.sh | sh && \
    rm -rf /var/lib/apt/lists/*

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Declare the volume for persistence
VOLUME /var/lib/tailscale

# Run the entrypoint
ENTRYPOINT ["/entrypoint.sh"]