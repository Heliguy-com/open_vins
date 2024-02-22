#!/bin/bash

# Thanks ChatGPT! I'm going to have to learn shell scripting because this looks fun

# TODO: To make this script more robust, allow support for open_vins built in any path
# Approach 1) Pattern matching
# CONFIG_PATH=$(echo "$link_target" | sed -n 's/.*\/*open_vins\/colcon_ws\/src\/ov_msckf\/..\/config\/\(.*\)/\1/p')
# BUILD_PATH=$(echo "$link_target" | sed -n 's/.*\/open_vins\/colcon_ws\/build\/\(.*\)/\1/p')
# Approach 2) Store build location in a variable and have it read when the script is run
# build_dir="/home/root/open_vins/colcon_ws"

install_dir="/opt/ros/foxy/open_vins"
build_dir="/home/root"

find $install_dir -type l -exec bash -c '
    link_target=$(readlink "$1")
    if [ ! -e "$link_target" ]; then
		echo "TARGET: $link_target"
        if [[ "$link_target" == ${build_dir}/open_vins/colcon_ws/build/* ]]; then
            BUILD_PATH=$(echo "$link_target" | cut -d'/' -f 7-)
            correct_path="/opt/ros/foxy/open_vins/build/$BUILD_PATH"

            if [ -e "$correct_path" ]; then
                echo "Correcting symlink: $1 -> $correct_path"
                ln -sf "$correct_path" "$1"
            else
                echo "Error: Target file not found for $1"
            fi

         elif [[ "$link_target" == ${build_dir}/open_vins/colcon_ws/src/* ]]; then
            SRC_PATH=$(echo "$link_target" | cut -d'/' -f 7-)
            correct_path="/opt/ros/foxy/open_vins/src/$SRC_PATH"

            if [ -e "$correct_path" ]; then
                echo "Correcting symlink: $1 -> $correct_path"
                ln -sf "$correct_path" "$1"
            else
                echo "Error: Target file not found for $1"
            fi

        fi
    fi
' _ {} \;