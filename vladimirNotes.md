# Running Catkin/Hydro

## Starting up robot
```bash
robot stop
robot claim
roslaunch /etc/ros/hydro/robot.launch # instead of robot start (TODO: this matters?)
roslaunch pr2_moveit_config move_group.launch # TODO: put in launch file
roslaunch pr2_pbd_interaction interaction_node.launch # TODO: I think (we've got to run PbD somewhere, right?)
```

## Commands on desktop
```bash
roslaunch rosbridge_server rosbridge_websocket.launch # TODO put in launch file
cd ~/catkin_ws/src/pr2_pbd/pr2_pbd_http
python -m SimpleHTTPServer # runs on 8000
roslaunch pr2_social_gaze gaze.launch
rosrun pr2_pbd_interaction interaction.py # main node
rosrun pr2_pbd_gui pr2_pbd_gui # rqt gui
```
