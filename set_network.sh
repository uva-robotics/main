
if [ "$1" ]; then
	ROS_MASTER="$1"
fi

if [ -z "$ROS_MASTER" ]; then
	ROS_MASTER=127.0.0.1
	echo "If you are running ROS within a network, please specify the ROS MASTER IP as an argument."
fi

echo "ROS_MASTER:     $ROS_MASTER"

export ROS_IP=`ip route get $ROS_MASTER | grep "src" | sed 's/.*src \([0-9\.]*\).*/\1/'`
export ROS_HOSTNAME=$ROS_IP
export ROS_MASTER_URI="http://$ROS_MASTER:11311"

echo "ROS_IP:         $ROS_IP"
echo "ROS_HOSTNAME:   $ROS_HOSTNAME"
echo "ROS_MASTER_URI: $ROS_MASTER_URI"
