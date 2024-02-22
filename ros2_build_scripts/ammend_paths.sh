#!/bin/bash

cd /opt/ros/foxy/open_vins/install/

find . -type d -name '*share*' | while read subfolder; do

    ov_node="$(dirname $subfolder | xargs basename)"
    subdir="${subfolder}/${ov_node}"

    find $subdir -type l -name 'local_setup.*' | while read local_setup; do

        echo $local_setup
        local_setup_filename=$(basename "$local_setup")

        target_local_setup="/opt/ros/foxy/open_vins/build/${ov_node}/ament_cmake_environment_hooks/${local_setup_filename}"
        echo $target_local_setup
        if [ -e "$target_local_setup" ]; then

            rm "$local_setup"
            ln -s "$target_local_setup" "$local_setup"
            echo "Updated symlink for ${ov_node}/${local_setup_filename}"
        fi
    done

    # find $subdir -type l -name '*.xml' | while read src_data; do

    #     echo $src_data
    #     src_data_filename=$(basename "$src_data")

    #     target_src_data="/data/openvins_data/${ov_node}/${src_data_filename}"
    #     if [ -e "$target_local_setup" ]; then

    #         rm "$src_data"
    #         cp "$target_src_data" "$src_data"
    #         echo "Updated data for ${ov_node}/${local_setup_filename}"
    #     fi
    # done
done