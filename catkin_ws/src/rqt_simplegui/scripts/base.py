#!/usr/bin/env python
import roslib
roslib.load_manifest('rospy')
roslib.load_manifest('geometry_msgs')

import rospy
from geometry_msgs.msg import Twist
from geometry_msgs.msg import Vector3

if __name__ == "__main__":
	# NOTE(max): This is actually required; otherwise, ROS yells at us. Looks
	# like if you want to publish from a topic, you have to have a node doing
	# it, even if it is 'anonymous.' Messages must come from some node!
	rospy.init_node('base_test_node', anonymous=True)

    topic_name = '/base_controller/command'
    base_publisher = rospy.Publisher(topic_name, Twist)

    twist_msg = Twist()
    twist_msg.linear = Vector3(-0.1, -0.1, 0.0)
    
    # Angular doesn't appear to do anything... Is this a pecularity of the PR2?
    # Or am I just doing it wrong?
    twist_msg.angular = Vector3(0.0, 0.0, 0.0)
    
    for i in range(100):
        base_publisher.publish(twist_msg)
        rospy.sleep(0.1)
