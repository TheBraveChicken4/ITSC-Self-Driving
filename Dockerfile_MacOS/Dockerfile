# Start with a minimal Ubuntu base image
FROM ubuntu:22.04

# Install basic utilities
RUN apt-get update -y && apt-get install -y \
    lsb-release \
    wget \
    gnupg \
    nano

# Set working directory
WORKDIR /root

# Default command to keep the container running
CMD ["bash"]
