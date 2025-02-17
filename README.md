# x11_maxima
Run Maxima and wxMaxima in a Docker container.

The Dockerfile installs X11, VNC server, maxima and wxmaxima applications.

When building make sure your network is fast to avoid apt timeouts.

Tested on Macbook Pro M1 - 16GB and Raspberry Pi5 16GB.


## Build the Container (one off build command)
**docker build -t x11maxima .**

Or run the script **docker_build.sh** 

**Note: Expect build times of over 15 minutes for the Raspberry PI version!**

## Run the container
**docker run -t x11maxima .**

**docker_run.sh**


## Use VNC Client to log into Linux Container 
Runs an X11/ARCH Linux system with maxima/wxmaxima 

simply VNC localhost:5901
