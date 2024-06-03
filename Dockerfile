# Welcome to the official dockerfile for ITSC Let's Build It! @UNCC
# The purpose of this file is to build a docker container ready to let 
#   students create their own "talker" and "listener" nodes in ROS2 Humble


# FIX XLAUNCH


# Start the docker with a pre-made baseline for ROS2 humble development
FROM osrf/ros:humble-desktop-full

# Upgrade and update the terminal
RUN apt update -y
RUN apt upgrade -y

# Install Gedit which is a useful text editor 
RUN sudo apt install gedit -y

# Make sure ROS2 is sourced. This is required to use ROS2 at all. FIX
RUN . /opt/ros/humble/setup.sh


# Make sure Colcon in installed (this is the build package for ROS2 humble)
#       Use 'source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash' to enable colcon autocomplete
RUN sudo apt-get install python3-colcon-common-extensions -y


#
#           *** Refer to the README for instructions on students building a package themselves.
#




#
#            ***      This section is only if we DO NOT want students to have to set up a workspace, build the package and create the node from scratch      ***
#
#
#
# Create the workspace for the ROS2 project and build it properly using colcon. This sets up good organization for the project.
#   A workspace in ros is nothing more than a folder. It is common to include _ws at the end of the name to denote its significance
#
#

RUN mkdir -p ~/ros2_ws/src
RUN cd ~/ros2_ws && colcon build


