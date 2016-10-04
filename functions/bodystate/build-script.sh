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

cd "$SKELS" && rm -f vizkit_bodystate.zip && zip vizkit_bodystate vizkit_bodystate/* && cd $OLDPWD

cd "$SKELS" && rm -f vizkit_rigidbodystate.zip && zip vizkit_rigidbodystate vizkit_rigidbodystate/* && cd $OLDPWD

cd "$SKELS" && rm -f test_bodystate.zip && zip test_bodystate test_bodystate/* && cd $OLDPWD

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
	--subC vizkit_bodystate:"$SKELS"/vizkit_bodystate.zip \
	--subC vizkit_rigidbodystate:"$SKELS"/vizkit_rigidbodystate.zip \
	--subC test_bodystate:"$SKELS"/test_bodystate.zip \
	-e x86_partition:"$SARGON_CURRENT_ROOT"/install/include \
	-l x86_partition:"$SARGON_CURRENT_ROOT"/install/lib/libvizkit-taste.so \
	-l x86_partition:"$SARGON_CURRENT_ROOT"/install/lib/libasn1-wrappers.so \
	$ORCHESTRATOR_OPTIONS
