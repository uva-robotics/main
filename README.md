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

