# This is the official dockerfile for ITSC Let's Build It!
# This will be a baseline docker to flash onto the AgileX LIMO robot at the beginning of each course
# 

FROM scratch

RUN pip install ros2

# ALL ACORDING TO ROS2 OFFICIAL WEBSITE INSTSALLATION
#           V ROS2 Humble Hawksbill (Recommended Ubuntu 22.04)

# Set Locale
RUN locale  # check for UTF-8

RUN sudo apt update && sudo apt install locales
RUN sudo locale-gen en_US en_US.UTF-8
RUN sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
RUN export LANG=en_US.UTF-8

RUN locale  # verify settings

# Setup Sources
RUN sudo apt install software-properties-common
RUN sudo add-apt-repository universe

# Add ROS2 GPG key with apt
RUN sudo apt update && sudo apt install curl -y
RUN sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

# Add repository to sources list
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

RUN sudo apt update
RUN sudo apt upgrade

# Desktop install
RUN sudo apt install ros-humble-desktop

# Replace ".bash" with your shell if you're not using bash
# Possible values are: setup.bash, setup.sh, setup.zsh
RUN source /opt/ros/humble/setup.bash

