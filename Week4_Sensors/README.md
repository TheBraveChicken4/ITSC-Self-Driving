# Sensors and Data Acquisition

Imagine being placed in the middle of a an unknown desert. You're left without the sight from your eyes, sound from the environment, and your sense of touch to feel the ground. You want to leave the desert but you have absolutely no idea where to even begin. 

This is a similar scenario for a robot that doesn't have sensors. Robots use a host of different sensors such as **cameras**, **Lidar**, **IMUs** ***(Inertial Measurement Units)*** **radar** and more. Though a robot can operate with only one of these sensors, combining many or all of them can lead to some powerful applications. Sensors are crucial for more complex aplications like self-driving. Imagine a Tesla trying to find its way through a city without cameras. 

You may be asking yourself, how do these sensors communicate with the robot? If the robot sees a person how does it know to stop. This is all through the communication of data (Typically CAN bus or ros2 components). Lidar for example is a very intuative way to map an environment. Lidar can be 2D or 3D and it is composed of a lot of data points in vectors. We can visualize this data with something called a point cloud. You can think of the way that Lidar works to be similar to how bats use echo location. As a robot navigates around an environment, the more it can see, and therefore the more pieces of a map it can put together. 

***ACTIVITY***
- In this activity you will run add several sensors to your moving robot in gazebo to allow it to .............


Navigate to the Gazebo Harmonic [official tutorials](https://gazebosim.org/docs/harmonic/sensors) and follow the necessary steps to add an IMU (Inertial Measurement Unit) sensor, Contact sensor, and Lidar sensor.




****************************************************
You can find the final world of this tutorial showing all these plugins in use here. You may also find an extensive set of world examples with many possible sensors and actuation capabilities in

*** IMPORTANT *** FINISH