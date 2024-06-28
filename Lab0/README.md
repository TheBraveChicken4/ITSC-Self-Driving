# Docker
This project contains a docker file that is built to set up and build dependencies necessary for creating and running ros nodes.

## Instructions to get docker set up on Windows
- First, open Docker Desktop and open a command line interface
- Next, type: `docker build -t lab0_image https://raw.githubusercontent.com/TheBraveChicken4/ITSC-Self-Driving/main/Dockerfile_Windows/Dockerfile` and press enter in the command line
- This should build the image correctly and you should see it in the desktop under the images tab
- Next, run the docker image by typing `docker run --name lab0_container -e DISPLAY=host.docker.internal:0.0 -it lab0_image`
You should now see a Linux terminal where "the line " (FIX) says root@ and a combination of some numbers and letters
- Start XLaunch and change **Display Number** to 0. Then press enter until the start window closes.
- This means you have correctly launched your docker container and you can move on to the next step


## Instructions to get docker set up on Mac
- First, open Docker Desktop and fresh a terminal
- Next, type: `docker build -t lab0_image https://raw.githubusercontent.com/TheBraveChicken4/ITSC-Self-Driving/main/Dockerfile_MacOS/Dockerfile` and press enter (NOTE: If you recieve a permission denied error, you may need to rerun the line above preceeded with the `sudo` command)
- This should build the image correctly and you should see it in the desktop under the images tab
    - This guide was tested on:
        - macOS Catalina 10.15.4
        - docker desktop 2.2.0.5 (43884) - stable release
        - XQuartz 2.7.11 (xorg-server 1.18.4)
        - MacBook Pro (Intel)
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
    - :0 means the display is running on display port 0. It is important that it's not saying `–nolisten tcp` which would block any X11 forwarding to the X11 display.
- Allow X11 forwarding via xhost `$ xhost +`
- Now you should be able to open windows through your docker container. You can test this by running a container and typing `gedit` (Ensure gedit is installed)


# Important
- Any subsequent attempt to run your docker container after having turned it off should use the command `dokcer exec -it name bash` In our case name would be `lab0_container`
- You will also need to make sure that you have 
    1. Docker desktop running and click the arrow to activate your container  
    2. Make sure you have correctly launched either XQuartz or XLaunch to be able to have popout windows


# Build the ROS2 Workspace
- After you have fully set up the docker container, you are ready to begin development
- In ROS2 Humble, we always need to make sure that ROS2 is correctly sourced. You can type and run the command `ros2` and you should see a list of commands. If you do not, type `source /opt/ros/humble/setup.bash` and try again
- In ROS2, packages are containers within a folder called your workspace. It is good practice to include ***'_ws'***  at the end of your folder name. For example, your workspace might be named ***'ros_ws'***
- Simply create a workspace folder using the Linux command `mkdir`. Name it ***'ros2_ws'*** for now. Navigate inside of your workspace using `cd ros2_ws`, and create another folder using the same command named ***'src'*** to store your code files
- Next, run the command `colcon build`. Colcon is the build tool that essentially sets up all the necessary dependencies builds your workspace. You should now see three more folders in your workspace. `build`, `install`, and `log` by running the Linux command `ls`
- Navigate back to your home directory by typing `cd ..`
- You can enable colcon autocomplete by running the command, `source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash`
- To be able to use your custom ros2 nodes, you need to source your project. You can do this by typing `source ~/ros2_ws/install/setup.bash`

# Build ROS2 Packages
- Contain intro about packages
- The first step in creating your first ROS2 package is to navigate to the src folder within your workspace. (Maybe they should practice by now changing directories and using Linux commands)
- Once you are in the src folder within your workspace, you can use the special ROS2 command to build a package. Type `ros2 pkg create PACKAGE_NAME --build-type ament_python --dependencies rclpy` and replace PACKAGE_NAME with the name of your package. In this case, we can name it ***'talker_listener_demo'***
   > - ***ros2 pkg create*** is the ROS2 command that we are using to create a package
   > - ***PACKAGE_NAME*** is the name you want to give your package
   > - ***--build-type ament_python*** is a flag that specifies that we want to write Python code within this package
   > - ***--dependencies rclpy*** is a flag that specifies other dependencies for this package. In this case, it is the Python library to write ros code, **rclpy** 
- Each package will be one subset of your application and can contain many nodes, each specific to the purpose of the package

- At this point, you can open up Visual Studio Code and click on your docker extension. You should see your container under the Containers tab. Click it
- Navigate to ros2_ws, src, then talker_listener_demo and explore the ros2 package that has been created
    - The first file is called `package.xml`. This file will be in every ros2 package and it contains the name of the package, version number, and author information
        - You can also see the `<depend>` tag that contains dependencies. rclpy should be visible
    - You will also see `setup.cfg` which tells ROS2 where the nodes are installed
    - You will see `setup.py`. This is similar to `package.xml`, but we can specify where we have our ros2 nodes installed. We will come back to this later
    - Lastly, you will see a `test` folder, a `resource` folder, and a folder that is the same name as your package
        - Inside the folder that has the same name as the package is where we will put our nodes
- After you familiarize yourself with your package, navigate back to your workspace through the command line (`cd ..`) and use colcon to build the workspace
- Everything should now be set up correctly to build our nodes!

    > **For your understanding**: If you navigate to the install directory of your workspace, you should see a folder that has the name of your package. When we use colcon build, it takes all the nodes and everything that you want to install from your package and places it inside the install folder. From there, you will be enabled to use ros2 command line tools such as `ros2 run` and `ros2 launch` to control your custom nodes and files.


# Build the Node
- In ROS2, a node is an executable that uses the ROS 2 client libraries to communicate with other nodes through messages passed over topics, services, or actions. It is essentially a program that sends and receives messages between parts of a ROS2 project
- To build your node, start by navigating to the folder whose name is the same as the package name, within the package you already created
    - The only present in this folder should be `__init__.py`
- Using a Linux command (SPECIFY OR NOT? FOR LEARNING PURPOSES), create a new python file within this folder called `my_talker.py`
- After that, go back to the source folder of your workspace, and then open Visual Studio Code
- Find the new Python file that you just created and open it

    > At this point it is optional if you would like to install the Visual Studio ROS extension to aid in ROS2 development. If you would like to, click the extensions tab and search for ***"ROS"***, and install the one at the top that is verified by Microsoft

- At the top of the file we need to make sure that we `import rclpy`, and `from rclpy.node import Node` if we want to use it to create a ROS2 node with python
- The next step is to create a `main` function with one parameter `args` that has a default value of `None`. Next, create a condition checking `if __name__ == '__main__'`. If it is true, call the main function. 
    - This is helpful for when we want to directly execute the file from the terminal
- The first thing to do in the main function is to initialize ROS2 communications. To do this, we need to call the `init` method from the package `rclpy` and pass `(args=args)`. This will be the first line in your main function, and `rclpy.shutdown()` will be the last

- The best practice for creating nodes in ROS2 is by using Object Oriented Programming. To begin, import `Node` from `rclpy.node` and create a new class called MyNode that inherits from the class `Node`
- Within your new node class, create an `__init__` method that has `self` as a parameter. Inside this method, call the parent class's `__init__` method and pass a string for the name of your node. In our case, pass ***"talker_node"***
- By doing this, we have achieved the minimum we need to do to create a node
- To make the node log to the terminal, underneath the `super().__init__()` call, write the line, `self.get_logger().info("Hello, ROS2!")`
- After that, we need to initialize our node within the main function. Between `rclpy.init()` and `rclpy.shutdown()`, initialize a new variable called `node` and create an instance of our `MyNode()`. Lastly, make sure to save your file


# Run the Node
- After saving your file, open up the terminal again and navigate to the folder inside your package where your Python file is located
- run the command `python3 FILE_NAME` where ***'FILE_NAME'*** is the name of your file.
- You should now see a message from the logger in the terminal that contains your message. Congratulations! You just ran your first custom ROS2 node


# Make it Cooler
- Once you have successfully run your ROS2 node, you may have noticed that it stops right after you run it. To change it and make the node never stop until you kill it with Ctrl+C, open up Visual Studio Code and navigate back to your python file
- Import `from std_msgs.msg import String`
- Update your `main()` function to contain the line: `rclpy.spin(node)` after you create your node so that it does not stop running. Make sure to save your file
- Next, we want to be able to run our node with a ROS2 command
- In Visual Studio Code, open `setup.py` and find the `entry_points=` argument
- You should see a line containing `'console_scripts': []`. Within these brackets is where we are going to make our ROS2 executable
- Inside of the brackets, we want to write our executable like this: `"EXEC_NAME = PKG_NAME.PYTHON_FILE:main"`
    - `EXEC_NAME` is the name we want to give our executable. In this case, we can call it `talker_node`
    - `PKG_NAME` is the name of our package. In this case that would be `talker_listener_demo`
    - `PYTHON_FILE` is the name of our python file. In this case that would be `my_talker` (Hint: we can omit the file extension here)
    - `:main` is the name of the function within the file we want to run
- Make sure to save your file, and then you can go back to the terminal and navigate back to the root of our workspace ***/ros2_ws***
- Run `colcon build`
***IMPORTANT*** - To use new functionalities that you have created, you need to source your workspace again: `source install/setup.bash`
- Once you have sourced your package again, we can use ROS2 to start our node. In the terminal, type `ros2 run PKG_NAME EXEC_NAME` and you should see the same output as before
    > There is a difference between the name of the node, the name of your Python file, and the name of the executable that you created. This can become difficult to keep track of but you can name them all the same for future projects

# Create a callback
- You may notice that when we run the node, even though it doesn't kill until we kill it, the node does not do anything more than log one line. To fix this, we can create a timer callback.
- Open your file up in Visual Studio code and create a new method within your node class called `timer_callback()`. Move the line that logs the message to the terminal into this new method
- Within the `__init__()` method inside of your node class, add a line to call the `self.create_timer()` method. This method takes two positional arguments that we care about. The first is a float number for the amount of seconds to wait between each call. The second is the callback that you want to run after each iteration. For this example, call the method so that it prints what it was printing before, one second apart, infinitely.
- Make sure to correctly build and source your package before you run your node again
- When you run your node now you should see a continuous stream of messages being printed

# Publishers and Subscribers
- This next part may be too advanced for Lab0 but to change our node to be a publisher, and make a new one that is a subscriber that can listen to what the publisher publishes, we need to learn about ***Topics***.
- You can think of topics like a bus system for nodes to communicate. If we need to send a message from one node to another we can accomplish this with the use of topics. This page is a good [resource](https://docs.ros.org/en/foxy/Tutorials/Beginner-CLI-Tools/Understanding-ROS2-Topics/Understanding-ROS2-Topics.html) even though it is a different ROS distro, topics remain similar, if not the same.

- With only a few extra lines of code in our talker node, we can make it publish to a topic!
```
import rclpy
from rclpy.node import Node
from std_msgs.msg import String

class MyTalkerNode(Node):
    def __init__(self):
        super().__init__('my_talker')
        self.talker_publisher = self.create_publisher(String, 'my_topic', 10)
        self.create_timer(1, self.timer_callback)
        self.i = 0

    def timer_callback(self):
        msg = String()
        msg.data = f"Hello ROS2! {self.i}"
        self.talker_publisher.publish(msg)
        self.get_logger().info('Publishing "%s"' % msg.data)
        self.i += 1



def main(args=None):
    rclpy.init(args=args)

    node = MyTalkerNode()   

    rclpy.spin(node)

    rclpy.shutdown()

if __name__ == '__main__':
    main()

```

- ***Make sure to properly build the project before running it***

- Before we continue, we can add another file in the same directory of our package called `my_listener.py`
- This is the same idea as before, but we want to be able to run this node and see the output from our talker node
- The inside of this file should look something like this:

```
import rclpy
from rclpy.node import Node
from std_msgs.msg import String

class MyListenerNode(Node):
    def __init__(self):
        super().__init__('my_listener')
        self.subscription = self.create_subscription(
            String, 
            'my_topic', 
            self.listener_callback, 
            10
        )
        self.subscription
        
    def listener_callback(self, msg):
        self.get_logger().info('I heard: "%s"' % msg.data)


def main(args=None):
    rclpy.init(args=args)

    node = MyListenerNode()

    rclpy.spin(node)

    rclpy.shutdown()


if __name__ == '__main__':
    main()
```

- Before we continue building the project ***Make sure you correctly add the contents for the listener node within the setup.py file, exactly where we did it for the talker***
- Now, go back to the root of your workspace and rebuild the project! (You may need to close and reopen the docker container)
- After that, open a new docker container in a new window and source your project in both windows (make sure ROS2 is correctly sourced as well)
- Try running `ros2 run talker_listener_demo talker_node` in one terminal, and `ros2 run talker_listener_demo listener_node` in another
- If everything is working properly, you should see the output from the talker in the terminal that you ran the listener



# **Helpful Tip**

If you would like to be able to source ROS2 every time you start your container, you can do so by editing the bashrc file.
- Go to the root of your container (You will automatically be put there when you start your container)
- Type `gedit ~/.bashrc` and scroll all the way to the bottom of the file.
- Without changing any of the lines that are already there, press enter a few times to be on a new line at the very bottom of the file.
- Add the line `source /opt/ros/humble/setup.bash` and press save.