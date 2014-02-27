# fourteen
There are a bunch of computers in CSE 014 and moving around them sucks. This should make it better by keeping all of my configurations (essential to ROS) *and* my code in one place.

## How to
0. `sudo apt-get install git emacs xclip`
0. `ssh-keygen -t rsa -C "014-<computer_name_in_lower>"`
0. `xclip -sel clip < ~/.ssh/id_rsa.pub`
0. Create new key in Github profile and paste.
0. `cd ~; git clone git@github.com:mbforbes/fourteen.git`
0. `cd ~/fourteen; mv * .[^.]* ../; cd ..; rmdir fourteen`
0. `source ~/.bashrc`
0. `sudo rosdep init; rosdep update`

That's it! Good to go.

## Sub-repositories
We don't want to double-track files, so here are the local and remote locations  and checkout commands for repositiories found within *fourteen*:

0. **PR2 PbD**
   - local: *~/rosbuild_ws/pr2_pdb/*
   - github: *https://github.com/mbforbes/pr2_pbd*
   - to acquire: `cd ~/rosbuild_ws/; git clone git@github.com:mbforbes/pr2_pbd.git`

## TODO
- Either get sublime settings saved and ported, or at least make a section on how to set it up and especially how to set up jedi (Python autocomplete / smart jumping)
  - sublime package manager
  - sublemacs
  - ruler at line 80
  - jedi for python
- Try to find commands to do the following (or list as steps):
  - [Unmap alt from using HUB](http://askubuntu.com/questions/122209/how-do-i-modify-or-disable-the-huds-use-of-the-alt-key)
  - [Unmap alt from opening terminal menu](http://stackoverflow.com/questions/14793561/emacs-in-ubuntu-terminal-meta-key-opens-menus)
## Reference
Here are some links for pages I used to figure out the above:

- [Generating SSH Keys](http://help.github.com/articles/generating-ssh-keys#platform-linux)
- [Move all files from current to upper directory](http://superuser.com/questions/62141/linux-how-to-move-all-files-from-current-directory-to-upper-directory)