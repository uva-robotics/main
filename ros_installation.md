
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
