# Welcome to the official dockerfile for ITSC Let's Build It! @UNCC
# The purpose of this file is to build a docker container ready to let 
#   students create their own "talker" and "listener" nodes in ROS2 Humble


# Start the docker with a pre-made baseline for ROS2 humble development
FROM osrf/ros:humble-desktop-full

# Upgrade and update the terminal
RUN apt update -y
RUN apt upgrade -y

# Install Gedit which is a useful text editor 
RUN sudo apt install gedit -y

# Make sure ROS2 is sourced. This is required to use ROS2 at all. 
RUN . /opt/ros/humble/setup.sh


# Make sure Colcon in installed (this is the build package for ROS2 humble)
#       Use 'source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash' to enable colcon autocomplete
RUN sudo apt-get install python3-colcon-common-extensions -y

# Install Gazebo-Harmonic (The most recent version of Gazebo)
RUN sudo apt-get update -y
RUN sudo apt-get install lsb-release wget gnupg -y

RUN sudo wget https://packages.osrfoundation.org/gazebo.gpg -O /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null
RUN sudo apt-get update -y
RUN sudo apt-get upgrade -y
RUN apt-get update -y -qq && apt-get install -y -qq gz-harmonic

### Make a bash file and make the docker much easier to work with
