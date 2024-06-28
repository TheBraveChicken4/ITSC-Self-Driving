# Welcome to the official dockerfile for ITSC Let's Build It! @UNCC
# The purpose of this file is to build a docker container ready to let 
#   students create their own "talker" and "listener" nodes in ROS2 Humble

# Start the docker with a pre-made baseline for ROS2 humble development
FROM osrf/ros:humble-desktop-full

# Install necessary packages and update/upgrade
RUN apt-get update -y && apt-get install -y \
    lsb-release \
    wget \
    gnupg

# Clean and update package cache
RUN apt-get clean && apt-get update -y

# Install Gedit
RUN apt-get install -y gedit

# Source ROS2 setup
RUN echo "source /opt/ros/humble/setup.sh" >> ~/.bashrc

# Install Colcon
RUN apt-get install -y python3-colcon-common-extensions

# Install Gazebo-Harmonic
RUN wget https://packages.osrfoundation.org/gazebo.gpg -O /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null && \
    apt-get update -y && apt-get install -y gz-harmonic




