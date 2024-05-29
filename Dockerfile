# This is the official dockerfile for ITSC Let's Build It!
# This will be a baseline docker to flash onto the AgileX LIMO robot at the beginning of each course
# 

FROM osrf/ros:humble-desktop-full

RUN sudo apt install ros-humble-navigation2 ros-humble-nav2-bringup ros2-humble-turtlebot3*

RUN export TURTLEBOT3_MODEL=waffle



