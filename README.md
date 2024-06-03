# Docker
This project contains a docker file that is built to set up and build dependencies necessary for creating and running ros nodes.
# Instructions to get docker set up on Windows
- First, open Docker Desktop and open a command line interface
- Next, type: `docker build -t lab0_image https://raw.githubusercontent.com/TheBraveChicken4/LimoDocker/main/Dockerfile` and press enter
- This should build the image correctly and you should see it in the desktop under the images tab
- Next, run the docker image by typing `docker run --name lab0_container -e DISPLAY=host.docker.internal:0.0 -it lab0_image`
- Start XLaunch and change **Display Number** to 0. Then press enter until the start window closes.
- You should now see a linux terminal where "the line " (FIX) says root@ and a combination of some numbers and letters
- This means you have correctly launched your docker container and you can move on to the next step

# Instructions to get docker set up on Mac
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
-

