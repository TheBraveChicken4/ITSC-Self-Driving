# Docker
This project contains a docker file that is built to set up and build dependencies necessary for creating and running ros nodes.
# Instructions to get docker set up on Windows
- First, open Docker Desktop and open a command line interface
- Next, type: `docker build -t lab0_image https://raw.githubusercontent.com/TheBraveChicken4/LimoDocker/main/Dockerfile` and press enter
- This should build the image correctly and you should see it in the desktop under the images tab
- Next, run the docker image by typing `docker run --name lab0_container -e DISPLAY=host.docker.internal:0.0 -it lab0_image`
- You should now see a linux terminal where "the line " (FIX) says root@ and a combination of some numbers and letters
- This means you have correctly launched your docker container and you can move on to the next step

# Instructions to get docker set up on Mac
- First, open Docker Desktop and fresh a terminal
- Next, type: `docker build -t lab0_image https://raw.githubusercontent.com/TheBraveChicken4/LimoDocker/main/Dockerfile` and press enter
- This should build the image correctly and you should see it in the desktop under the images tab
*   this is instruction

