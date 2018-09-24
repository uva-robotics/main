# UvA Intelligent Robotics Lab

Repository for the development of intelligent systems for the UvA Intelligent Robotics Lab.


## ROS + Docker
<p align="center">
<img src="readme/ros_docker.png"/>
</p>

From June 2018 onward, we will be using Docker for the deployment of our code.
This makes our code easily:
- Repeatable
- Reproducible
- Deployable

We use it to manage:
- cross compilation
- complexity
- custom dependencies
- pushing new programs and changes for multiple robots

Benefits include: launch and manage swarms of nodes, virtual networking between the nodes, blending of cloud and robotic software tools.

## Installation
Docker is available for: Linux, macOS and Windows.
For macOS and Windows, visit https://docker.com

For Linux (Debian-based):  
`sudo apt-get install docker.io`


## Deployment
`./init_docker.sh` will run docker-compose that initializes all the containers that run our code.

To be able to run graphical applications inside docker, you will need to give the root user access to display windows. This can be done using the following command.

```bash
xhost +SI:localuser:root
```


##### Docker commands
`docker ps` will list all running containers.  
Click <a href="https://github.com/wsargent/docker-cheat-sheet">here</a> for a nice cheatsheet.

## Boilerplate package
In the https://github.com/uva-robotics/boilerplate respository, you will find a template for creating your own ROS-enabled packages (with Docker deployment). It contains one meta-package folder and the package folder itself. We use meta-packages so that we don't get a lot of sub-repositories in our git directory. The boilerplate can be used for C++ and Python (2.7) code.


# ROS installation

For reference.

###### Add keys and update package manager.
```
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt-get update
```
###### Full install:
```
sudo apt-get install ros-kinetic-desktop-full
```
###### Minimum install:
```
sudo apt-get install ros-kinetic-ros-base
```

###### Initialize rosdep
```
sudo rosdep init
rosdep update
```

###### Environment setup
```
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
```

###### Dependencies for building packages
```
sudo apt-get install python-rosinstall python-rosinstall-generator python-wstool build-essential
```

### Installing ROS Pepper
```
sudo apt-get install ros-kinetic-pepper-.*
```

Go into your workspace (e.g. ~/projects/uva-robotics).</br>
Navigate to src directory (e.g. ~/projects/uva-robotics/src).

```
git clone https://github.com/ros-naoqi/naoqi_driver.git
rosdep install -i -y --from-paths ./naoqi_driver
source /opt/ros/kinetic/setup.sh
cd ../ && catkin_make
```

# Running ROS
###### (Pepper example)
Run the following command to run roscore:
```
roscore
```

### C++ version:
```
roslaunch pepper_bringup pepper_full.launch nao_ip:=<yourRobotIP> roscore_ip:=<roscore_ip> [network_interface:=<eth0|wlan0|vpn0>]
```

### Python version:
```
roslaunch pepper_bringup pepper_full_py.launch nao_ip:=<yourRobotIP> roscore_ip:=<roscore_ip>
```

# Using ROS
First, make sure you are running <i>roscore</i> in a seperate terminal.
```
roscore
```

List all running nodes:</br>
```
rosnode list
```

List all topics:</br>
```
rostopic list
```

View data from topic:</br>
```
rostopic echo <topic>
```

Run a ROS package script:
```
rosrun <package_name> <script_name>
```

Run a ROS launch file:
```
roslaunch <package_name> <launch_file_name>
```

