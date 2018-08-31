## Pepper startup
roslaunch pepper_bringup pepper_full.launch nao_ip:=146.50.60.54 roscore_ip:=127.0.0.1 network_interface:=wlp2s0 &
roslaunch pepper_dcm_bringup pepper_bringup.launch robot_ip:=146.50.60.54 network_interface:=wlp2s0 &

## Rviz
rosrun rviz rviz -d pepper.rviz &

## MoveIt
roslaunch pepper_moveit_config moveit_planner.launch

# Scratchpad
export PYTHONPATH=${PYTHONPATH}:/root/s/UvA/robolab/pynaoqi/lib/python2.7/site-packages
