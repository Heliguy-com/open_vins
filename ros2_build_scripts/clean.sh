#!/bin/bash
#
# Modal AI Inc. 2023
# author: zachary.lowell@ascendengineer.com


sudo rm -rf build/
sudo rm -rf build32/
sudo rm -rf build64/
sudo rm -rf pkg/control.tar.gz
sudo rm -rf pkg/data/
sudo rm -rf pkg/data.tar.gz
sudo rm -rf pkg/DEB/
sudo rm -rf pkg/IPK/
sudo rm -rf *.deb
sudo rm -rf .bash_history

sudo rm -rf colcon_ws_qrb5165/build/
sudo rm -rf colcon_ws_qrb5165/install/
sudo rm -rf colcon_ws_qrb5165/log/
sudo rm -rf colcon_ws_qrb5165/src/ov_*
