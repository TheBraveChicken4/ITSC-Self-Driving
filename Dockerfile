# This is the official dockerfile for ITSC Let's Build It!
# This will be a baseline docker to flash onto the AgileX LIMO robot at the beginning of each course
# 

FROM osrf/ros:humble-desktop-full

RUN apt-get update
RUN apt-get -y upgrade

RUN sudo apt-get -y install ros-humble-navigation2
RUN apt-get update 
RUN sudo apt-get -y install ros-humble-nav2-bringup 
RUN apt-get update
RUN sudo apt-get -y install ros-humble-turtlebot3* 

RUN export TURTLEBOT3_MODEL=waffle



