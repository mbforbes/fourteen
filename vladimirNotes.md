# Running PbD under Catkin/Hydro

## Starting up robot
TODO: put these in a launch file
```bash
# terminal 1 [launch robot under hydro]
robot stop
robot claim
roslaunch /etc/ros/hydro/robot.launch # instead of robot start (TODO: this matters?)

# terminal 2 [start moveit]
roslaunch pr2_moveit_config move_group.launch 

# terminal 3 [start PbD]
roslaunch pr2_pbd_interaction interaction_node.launch
```

## Commands on desktop
TODO: put these in a launch file
```bash
# terminal 1 [run rosbridge]
roslaunch rosbridge_server rosbridge_websocket.launch

# terminal 2 [run HTTP server]
cd ~/catkin_ws/src/pr2_pbd/pr2_pbd_http; python -m SimpleHTTPServer # runs on 8000

# terminal 3 [run social gaze]
realrobot; roslaunch pr2_social_gaze gaze.launch # (TODO: can this be on Rosie instead?)

# terminal 4 [open a GUI]
google-chrome localhost:8000 # for HTML GUI
rosrun pr2_pbd_gui pr2_pbd_gui # for RQT GUI
```
