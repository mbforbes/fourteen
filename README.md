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

Then we should be good to go... haven't tested this yet and it could get jenky because of the "moving directory around" weirdness... we'll see...

Links for this
- http://help.github.com/articles/generating-ssh-keys#platform-linux
- http://superuser.com/questions/62141/linux-how-to-move-all-files-from-current-directory-to-upper-directory

## Sub-repositories
We don't want to double-track files, so here are the local, remote locations of repositiories found within `fourteen`:

0. rosbuild_ws/pr2_pdb/, https://github.com/mbforbes/pr2_pbd