#!/bin/bash

# This script will build your TASTE system.

# You should check it before running it to make it fit with your context:
# 1) You may need to fix some paths and filenames (path to interface/deployment views)
# 2) You may need to specify additional paths for the compiler to find .h file
#    (e.g. "export C_INCLUDE_PATH=/usr/include/xenomai/analogy/:$C_INCLUDE_PATH")
# 3) You may need to link with pre-built libraries, using the -l option
#    (e.g. -l /usr/lib/libanalogy.a,/usr/lib/librtdm.a)
# 4) You may need to change the runtime (add -p flag to select PolyORB-HI-C)
# etc.

# Note: TASTE will not overwrite your changes - if you need to update some parts
#       you will have to merge the changes with the newly-created file.

if [ -z "$DEPLOYMENTVIEW" ]
then
    DEPLOYMENTVIEW=DeploymentView.aadl
fi

SKELS="./"

# Update the data view with local paths
#taste-update-data-view
./compileAllASN.sh

cd "$SKELS" && rm -f test_range.zip && zip test_range test_range/* && cd $OLDPWD

cd "$SKELS" && rm -f vizkit_pointcloud.zip && zip vizkit_pointcloud vizkit_pointcloud/* && cd $OLDPWD

cd "$SKELS" && rm -f vizkit_depthmap.zip && zip vizkit_depthmap vizkit_depthmap/* && cd $OLDPWD

cd "$SKELS" && rm -f vizkit_laserscan.zip && zip vizkit_laserscan vizkit_laserscan/* && cd $OLDPWD

cd "$SKELS" && rm -f vizkit_sonarbeam.zip && zip vizkit_sonarbeam vizkit_sonarbeam/* && cd $OLDPWD

[ ! -z "$CLEANUP" ] && rm -rf binary

if [ -f ConcurrencyView.pro ]
then
    ORCHESTRATOR_OPTIONS+=" -w ConcurrencyView.pro "
fi

if [ ! -z "$USE_POHIC" ]
then
    OUTPUTDIR=binary.c
    ORCHESTRATOR_OPTIONS+=" -p "
elif [ ! -z "$USE_POHIADA" ]
then
    OUTPUTDIR=binary.ada
else
    OUTPUTDIR=binary
fi
assert-builder-ocarina.py \
	--fast \
	--debug \
	--aadlv2 \
	--keep-case \
	--interfaceView InterfaceView.aadl \
	--deploymentView "$DEPLOYMENTVIEW" \
	-o "$OUTPUTDIR" \
	--subC test_range:"$SKELS"/test_range.zip \
	--subC vizkit_pointcloud:"$SKELS"/vizkit_pointcloud.zip \
	--subC vizkit_depthmap:"$SKELS"/vizkit_depthmap.zip \
	--subC vizkit_laserscan:"$SKELS"/vizkit_laserscan.zip \
	--subC vizkit_sonarbeam:"$SKELS"/vizkit_sonarbeam.zip \
	-e x86_partition:"$SARGON_CURRENT_ROOT"/install/include \
	-l x86_partition:"$SARGON_CURRENT_ROOT"/install/lib/libvizkit-taste.so \
	-l x86_partition:"$SARGON_CURRENT_ROOT"/install/lib/libasn1-wrappers.so \
	$ORCHESTRATOR_OPTIONS
