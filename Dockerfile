# Welcome to the official dockerfile for ITSC Let's Build It! @UNCC
# The purpose of this file is to build a docker container ready to let 
#   students create their own "talker" and "listener" nodes in ROS2 Humble

# Start the docker with a pre-made baseline for ROS2 humble development
FROM osrf/ros:humble-desktop-full

# Upgrade and update the terminal
RUN apt-get update
RUN apt-get -y upgrade



