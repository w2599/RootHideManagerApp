#!/bin/bash

cd $(dirname $0);pwd
export DEVELOPER_DIR="/Applications/Xcode-14.3.0.app/Contents/Developer"
export THEOS=/Users/zqbb/theos_roothide
export package FINALPACKAGE=1
export THEOS_PACKAGE_SCHEME=roothide
export THEOS_DEVICE_IP=192.168.31.158
export THEOS_DEVICE_PORT=2222


make do
make clean
