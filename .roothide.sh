#!/bin/bash
export LC_ALL=C
export THEOS=/Users/zqbb/theos_roothide
export THEOS_PACKAGE_SCHEME=roothide

#取绝对路径
tweakPath=$(cd "$(dirname "$0")";pwd)
buildPath="$(dirname "$tweakPath")/__build_roothide/$(basename "$tweakPath")"
echo "tweakPath: $tweakPath"
echo "buildPath: $buildPath"
cd $tweakPath
rm -rf .theos
rm -rf packages


versionFile=$(ls _version_* | head -n 1)
versionSee=$(echo $versionFile | sed 's/_version_//g')

versionRSA="1.0"

# 备份原文件
rm -rf $buildPath && mkdir -p $buildPath && cp -a ./ $buildPath && cd $buildPath


if [ $1 -eq "0" ]
then
    export package FINALPACKAGE=1
	export THEOS_PACKAGE_SCHEME=roothide

	make do -j$(sysctl -n hw.physicalcpu)
	cp -f ./packages/*.deb ${HOME}/Documents/GitHub/myTweaks/roothide/
	exit
fi


if [ $1 -eq "1" ]
then
    export package FINALPACKAGE=1
	export THEOS_PACKAGE_SCHEME=roothide
	make do 
	exit
fi

