# Docker
This project contains a docker file that is built to set up and build dependencies necessary for creating and running ros nodes.
## Instructions to get docker set up on Windows
- First, open Docker Desktop and open a command line interface
- Next, type: `docker build -t lab0_image https://raw.githubusercontent.com/TheBraveChicken4/LimoDocker/main/Dockerfile` and press enter
- This should build the image correctly and you should see it in the desktop under the images tab
- Next, run the docker image by typing `docker run --name lab0_container -e DISPLAY=host.docker.internal:0.0 -it lab0_image`
You should now see a linux terminal where "the line " (FIX) says root@ and a combination of some numbers and letters
- Start XLaunch and change **Display Number** to 0. Then press enter until the start window closes.
- This means you have correctly launched your docker container and you can move on to the next step

## Instructions to get docker set up on Mac
- First, open Docker Desktop and fresh a terminal
- Next, type: `docker build -t lab0_image https://raw.githubusercontent.com/TheBraveChicken4/LimoDocker/main/Dockerfile` and press enter
- This should build the image correctly and you should see it in the desktop under the images tab
    - This guide was tested on:
        - macOS Catalina 10.15.4
        - docker desktop 2.2.0.5 (43884) - stable release
        - XQuartz 2.7.11 (xorg-server 1.18.4)
        - Macbook Pro (Intel)
        - macOS Ventura 13.1
        - docker desktop 4.15.0 (93002)
        - XQuartz 2.8.4
        - Mac Studio (M1)


Follow this tutorial https://gist.github.com/sorny/969fe55d85c9b0035b0109a31cbcb088:
- **You must have already installed XQuartz**
- Start XQuartz by opening a terminal and typing `$ open -a XQuartz`
- Navigate to Security Settings and ensure that "Allow connections from network clients" is on
- Restart your Mac and start XQuartz again with `$ open -a XQuartz`
- Check if XQuartz is running correctly with `$ ps aux | grep Xquartz`
- Ensure that XQuartz is running similar to: `/opt/X11/bin/Xquartz :0 -listen tcp`
    - :0 means the display is running on display port 0. Important is that its not saying `–nolisten tcp` which would block any X11 forwarding to the X11 display.
- Allow X11 forwarding via xhost `$ xhost +`
- Now you should be able to open windows through your docker container. You can test this by running a container and typing `gedit` (Ensure gedit is installed)


# Build the ROS2 Workspace
- After you have fully set up the docker container, you are ready to begin development
- In ROS2 Humble, we always need to make sure that ROS2 is correctly sourced. You can type and run the command `ros2` and you should see a list of commands. If you do not, type `source /opt/ros/humble/setup.bash` and try again
- In ROS2, packages are container within a folder called your workspace. It is good practice to include ***'_ws'***  at the end of your folder name. For example, your workspace might be named ***'ros_ws'***
- Simple create a workspace folder using the linux command `mkdir`. Name it ***'ros2_ws'*** for now. Navigate inside of your workspace using `cd ros2_ws`, and create another folder using the same command named ***'src'*** to store your code files
- Next, run the command `colcon build`. Colcon is the build tool that essentially sets up all the necessary dependencies builds your workspace. You should now see three more folders in your workspace. `build`, `install`, and `log` by running the linux command `ls`
- Navigate back your home directory by typing `cd ..`
- You can enable colcon autocomplete by running the command, `source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash`
- To be able to use your custom ros2 nodes, you need to source your project. You can do this by typing `source ~/ros2_ws/install/setup.bash`

# Build ROS2 Packages
- Contain intro about packages
- The first step in creating your first ROS2 package is to navigate to the src folder within your workspace. (Maybe they should practice by now changing directories and using linux commands)
- Once you are in the src folder within your workspace, you can use the special ROS2 command to build a package. Type `ros2 pkg create PACKAGE_NAME --build-type ament_python --dependencies rclpy` and replace PACKAGE_NAME with the name of your package. In this case we can name it ***'talker_listener_demo'***
    - ***ros2 pkg create*** is the ROS2 command that we are using to create a package
    - ***PACKAGE_NAME*** is the name you want to give your package
    - ***--build-type ament_python*** is a flag that specifies that we want to write python code within this package
    - ***--dependencies rclpy*** is a flag that specifies other dependencies for this package. In this case it is the python library to write ros code, **rclpy** 
- Each package will be one subset of your application and can contain many nodes, each specific to the purpose of the package

- At this point you can open up Visual Studio Code and click on your docker extension. You should see your container under the containers tab
- Navigate to ros2_ws, src, then talker_listener_demo and explore the ros2 package that has been created
    - The first file is called `package.xml`. This file will be in every ros2 package and it contains the name of the package, version number and author information
        - You can also see the `<depend>` tag that contains dependencies. rclpy should be visible
    - You will also see `setup.cfg` which tells ros where the nodes are installed
    - You will see `setup.py`. This is similar to `package.xml`, but we can actually specify where we have our ros2 nodes installed. We will come back to this later
    - Lastly you will see a `test` folder, a `resource` folder, and a folder that is the same name as your package
        - Inside the folder that has the same name as the package is where we will put our nodes
- After you familiarize yourself with your package, navigate back to your workspace (`cd ..`) and use colcon to build the workspace
- Everything should now be set up correctly to build our nodes!

    > **For your understanding**: If you navigate to the install directory of your workspace, you should see a folder that has the name of your package. When we use colcon build, it takes all the nodes and everything that you want to install from your package, and it will put it inside the install folder. From there, you will be enabled to use ros2 command line tools such as `ros2 run` and `ros2 launch` to control your custom nodes and files.


# Build the Nodes

