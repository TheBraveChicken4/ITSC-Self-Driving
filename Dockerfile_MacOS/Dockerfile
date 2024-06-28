# Start with a minimal Ubuntu base image
FROM ubuntu:22.04

# Install basic packages
RUN apt-get update -y && apt-get install -y \
    lsb-release \
    wget \
    gnupg \
    gedit \
    python3-colcon-common-extensions \
    && apt-get clean

# Add ROS2 setup
RUN echo "deb [arch=amd64] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/ros2-latest.list \
    && apt-get update -y && apt-get install -y ros-humble-desktop-full \
    && apt-get clean

# Set working directory
WORKDIR /root

# Default command to keep the container running
CMD ["bash"]