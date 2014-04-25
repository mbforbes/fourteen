# Running Catkin/Hydro

## Starting up robot
```bash
stop
robot claim
roslaunch /etc/ros/hydro/robot.launch
roslaunch pr2_moveit_config move_group.launch # TODO put in launch file
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
