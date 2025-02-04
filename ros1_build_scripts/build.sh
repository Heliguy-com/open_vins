#!/bin/bash
#
# builds everything without installing
#
# Modal AI Inc. 2019
# author: james@modalai.com


set -e

cd catkin_ws_qrb5165

AVAILABLE_PLATFORMS="qrb5165 apq8096"

print_usage(){
    echo ""
    echo " Build the current project based on platform target."
    echo ""
    echo " Usage:"
    echo ""
    echo "  ./build.sh apq8096"
    echo "        Build 64-bit binaries for apq8096"
    echo ""
    echo "  ./build.sh qrb5165"
    echo "        Build 64-bit binaries for qrb5165"
    echo ""
    echo ""
}



case "$1" in
    apq8096)
        ROS_DIST="indigo"
        ;;
    qrb5165)
        ROS_DIST="melodic"
        ;;

    *)
        print_usage
        exit 1
        ;;
esac

. /opt/ros/${ROS_DIST}/setup.bash

cp -r ../ov_core src/
cp -r ../ov_data src/
cp -r ../ov_eval src/
cp -r ../ov_init src/

# catkin_make install -DCMAKE_BUILD_TYPE=Debug
catkin build

cd ..

mkdir -p misc_files/opt/ros/${ROS_DIST}/
cp -r catkin_ws_qrb5165/*  misc_files/opt/ros/${ROS_DIST}/
cp -r config misc_files/etc/modalai/openvins_config
chmod -R 777 misc_files
