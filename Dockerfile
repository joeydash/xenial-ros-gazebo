FROM ubuntu:xenial
MAINTAINER Joeydash joeydash@saarang.org

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y build-essential tree curl wget lsb-release

# Install ROS
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
RUN apt-get -y update
RUN apt-get -y install ros-kinetic-desktop-full
RUN rosdep init
RUN rosdep update
RUN apt install -y python-rosinstall python-rosinstall-generator python-wstool build-essential


# Install gazebo 9
RUN sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
RUN wget http://packages.osrfoundation.org/gazebo.key -O - | apt-key add -
RUN apt-get update
RUN apt-get -y install libignition-math3
RUN apt-get -y install gazebo9

# RUN sudo apt-get urospack find roscpppdate
# RUN sudo apt-get install gazebo9

# Install gazebo-ros packages
# RUN apt-get install -y ros-indigo-gazebo9-ros-pkgs ros-indigo-gazebo9-ros-control
# RUN wget https://raw.githubusercontent.com/osrf/osrf-rosdep/master/gazebo9/00-gazebo9.list -O /etc/ros/rosdep/sources.list.d/00-gazebo9.list
# RUN rosdep update
# RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
