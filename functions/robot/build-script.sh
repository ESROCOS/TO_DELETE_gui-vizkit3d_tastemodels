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

if [ -f user_init_pre.sh ]
then
    echo [INFO] Executing user-defined init script
    source user_init_pre.sh
fi

if [ -z "$DEPLOYMENTVIEW" ]
then
    DEPLOYMENTVIEW=DeploymentView.aadl
fi

SKELS="./"

# Update the data view with local paths
../../scripts/update-data-view.sh

cd "$SKELS" && rm -f vizkit_robot.zip && zip vizkit_robot vizkit_robot/* && cd $OLDPWD

cd "$SKELS" && rm -f test_robot.zip && zip test_robot test_robot/* && cd $OLDPWD

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

if [ -f user_init_post.sh ]
then
    echo [INFO] Executing user-defined init script
    source user_init_post.sh
fi

assert-builder-ocarina.py \
        --no-retry \
	--fast \
	--debug \
	--aadlv2 \
	--keep-case \
	--interfaceView InterfaceView.aadl \
	--deploymentView "$DEPLOYMENTVIEW" \
	-o "$OUTPUTDIR" \
	--subC vizkit_robot:"$SKELS"/vizkit_robot.zip \
	--subC test_robot:"$SKELS"/test_robot.zip \
	-e x86_partition:"$AUTOPROJ_CURRENT_ROOT"/install/include \
	-l x86_partition:"$AUTOPROJ_CURRENT_ROOT"/install/lib/libvizkit3d_c.so \
	-l x86_partition:"$AUTOPROJ_CURRENT_ROOT"/install/lib/libasn1_types_support.so \
	$ORCHESTRATOR_OPTIONS
