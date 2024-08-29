# Introduction to AI for Robotics

**Artificial Intelligence** is the field of computer science focused on creating systems capable of performing tasks that typically require human intelligence. This includes tasks such as learning, reasoning, problem-solving, perception, and understanding languages such as English or Spanish. AI enables machines to adapt to new inputs, make decisions, and improve their performance over time through experience and data.

AI is extremely versatile and one of the areas that it has heavily affected is robotics. AI is everywhere you look in robotics. Industrial robots, service robots, medical robots, educational robots and of course self-driving cars all rely heavily on artificial intelligence. Robots use AI in ways such as for perception, decision-making, prediction, Natural Language Processing (NLP) learning/adaptation. 

In this section of the course, you will learn about some of these AI models and how to implement them in robotics. 


# Implementation
- There are many tools out there that have been created to make implementing code really easy. This is also known as inference (running a working model from the internet with your own data). for our first lesson, you will use the camera on your computer to create and object detection model using a pre-made model called [YOLOv8](https://github.com/ultralytics/ultralytics) that was created by a company called Utralytics.

!!!!!!!!!!!!!!! MAKE SURE TO ADD MACBOOK VERSION
- The first step to creating this proeject is to open a terminal either on your computer or in your code editor, and type the command `python -m venv venv`. This will create a virtual environment that acts as a container to store packages that you can install
- Once that has finished compiling, make sure to activate the virtual environment by typing `venv\Scripts\activate`. You should now see the command line preceeded with **(venv)**
- When you see that, you are now free to install things inside of your virtual environment, without them being installed to your global computer. This can help with things like version control. Type the command `pip install ultralytics opencv-python` to install the necessary packages to run YOLOv8 in real time from your computers webcam
- You should now be able to run the code found in the file called ***model.py***. This uses a pre-made model from YOLOv8 to detect items relevant to the purpose of self-driving. 