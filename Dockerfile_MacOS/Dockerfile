# Welcome to the official dockerfile for ITSC Let's Build It! @UNCC
# The purpose of this file is to build a docker container ready to let 
#   students create their own "talker" and "listener" nodes in ROS2 Humble

# Start the docker with a pre-made baseline for ROS2 humble development
FROM osrf/ros:humble-desktop-full

# Upgrade and update the terminal
RUN apt-get update -y && apt-get upgrade -y

# Install Gedit which is a useful text editor 
RUN apt-get install gedit -y

# Make sure ROS2 is sourced. This is required to use ROS2 at all. 
RUN echo "source /opt/ros/humble/setup.sh" >> ~/.bashrc

# Make sure Colcon is installed (this is the build package for ROS2 humble)
RUN apt-get install python3-colcon-common-extensions -y

# Install Gazebo-Harmonic (The most recent version of Gazebo)
RUN apt-get update -y && apt-get install lsb-release wget gnupg -y \
    && wget https://packages.osrfoundation.org/gazebo.gpg -O /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null \
    && apt-get update -y && apt-get upgrade -y && apt-get install -y gz-harmonic



