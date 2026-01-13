#!/bin/bash
export LC_ALL=C
export THEOS=/Users/zqbb/theos_roothide
export DEVELOPER_DIR="/Applications/Xcode-14.3.0.app/Contents/Developer"
export THEOS_PACKAGE_SCHEME=roothide
export THEOS_DEVICE_IP=192.168.31.158
export THEOS_DEVICE_PORT=54322

#取绝对路径
tweakPath=$(cd "$(dirname "$0")";pwd)
buildPath="$(dirname "$tweakPath")/__build_roothide/$(basename "$tweakPath")"
echo "tweakPath: $tweakPath"
echo "buildPath: $buildPath"
cd $tweakPath
# make clean


versionFile=$(ls _version_* | head -n 1)
versionSee=$(echo $versionFile | sed 's/_version_//g')

versionRSA="1.0"

# 备份原文件
rm -rf $buildPath && mkdir -p $buildPath && cp -a ./ $buildPath && cd $buildPath


if [ $1 -eq "0" ]
then
    export package FINALPACKAGE=1
	export THEOS_PACKAGE_SCHEME=roothide

	make package -j$(sysctl -n hw.physicalcpu)
	# cp -f ./packages/*.deb /Users/zqbb/Documents/GitHub/myTweaks/rootless/
	exit
fi


if [ $1 -eq "1" ]
then
    export package FINALPACKAGE=1
	export THEOS_PACKAGE_SCHEME=roothide
	make do 
	exit
fi



if [ $1 -eq "10" ]
then
    export THEOS_DEVICE_IP=192.168.31.159
    export THEOS_DEVICE_PORT=54323
    export package FINALPACKAGE=1
	export THEOS_PACKAGE_SCHEME=roothide
	make do 
	cp -f ./packages/*.deb /Users/zqbb/Documents/GitHub/myTweaks/roothide/
	exit
fi

