#!/bin/bash

source /opt/ros/humble/setup.bas

export MAKEFLAGS="-j 6"
colcon build --executor sequential
