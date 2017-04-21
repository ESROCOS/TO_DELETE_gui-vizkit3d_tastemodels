#!/bin/bash

# This script will build your TASTE system (by default with the C runtime).

# You should not change this file as it was automatically generated.

# If you need additional preprocessing, create a file named 'user_init_pre.sh'
# and/or 'user_init_post.sh - They will never get overwritten.'

# Inside these files you may set some environment variables:
#    C_INCLUDE_PATH=/usr/include/xenomai/analogy/:$C_INCLUDE_PATH
#    unset USE_POHIC   

CWD=$(pwd)

if [ -t 0 ] ; then
    COLORON="\e[1m\e[32m"
    COLOROFF="\e[0m"
else
    COLORON=""
    COLOROFF=""
fi
INFO="${COLORON}[INFO]${COLOROFF}"

if [ -f user_init_pre.sh ]
then
    echo -e "${INFO} Executing user-defined init script"
    source user_init_pre.sh
fi

# Use PolyORB-HI-C runtime
USE_POHIC=1

# Detect models from Ellidiss tools v2, and convert them to 1.3
INTERFACEVIEW=InterfaceView.aadl
grep "version => \"2" InterfaceView.aadl >/dev/null && {
    echo -e "${INFO} Converting interface view from V2 to V1.3"
    TASTE --load-interface-view InterfaceView.aadl --export-interface-view-to-1_3 __iv_1_3.aadl
    INTERFACEVIEW=__iv_1_3.aadl
};

if [ -z "$DEPLOYMENTVIEW" ]
then
    DEPLOYMENTVIEW=DeploymentView.aadl
fi

# Detect models from Ellidiss tools v2, and convert them to 1.3
grep "version => \"2" "$DEPLOYMENTVIEW" >/dev/null && {
    echo -e "${INFO} Converting deployment view from V2 to V1.3"
    TASTE --load-deployment-view "$DEPLOYMENTVIEW" --export-deployment-view-to-1_3 __dv_1_3.aadl
    DEPLOYMENTVIEW=__dv_1_3.aadl
};

SKELS="./"

# Update the data view with local paths
taste-update-data-view

cd "$SKELS" && rm -f test_trajectory.zip && zip test_trajectory test_trajectory/* && cd $OLDPWD

cd "$SKELS" && rm -f vizkit_trajectory.zip && zip vizkit_trajectory vizkit_trajectory/* && cd $OLDPWD

cd "$SKELS" && rm -f vizkit_waypoint.zip && zip vizkit_waypoint vizkit_waypoint/* && cd $OLDPWD

cd "$SKELS" && rm -f vizkit_motioncommand.zip && zip vizkit_motioncommand vizkit_motioncommand/* && cd $OLDPWD

cd "$SKELS" && rm -f vizkit_trajectory2.zip && zip vizkit_trajectory2 vizkit_trajectory2/* && cd $OLDPWD

cd "$SKELS" && rm -f vizkit_motioncommand2.zip && zip vizkit_motioncommand2 vizkit_motioncommand2/* && cd $OLDPWD

cd "$SKELS" && rm -f vizkit_waypoint2.zip && zip vizkit_waypoint2 vizkit_waypoint2/* && cd $OLDPWD

[ ! -z "$CLEANUP" ] && rm -rf binary*

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
    echo -e "${INFO} Executing user-defined init script"
    source user_init_post.sh
fi

cd "$CWD" && assert-builder-ocarina.py \
	--fast \
	--debug \
	--aadlv2 \
	--keep-case \
	--interfaceView "$INTERFACEVIEW" \
	--deploymentView "$DEPLOYMENTVIEW" \
	-o "$OUTPUTDIR" \
	--subC test_trajectory:"$SKELS"/test_trajectory.zip \
	--subC vizkit_trajectory:"$SKELS"/vizkit_trajectory.zip \
	--subC vizkit_waypoint:"$SKELS"/vizkit_waypoint.zip \
	--subC vizkit_motioncommand:"$SKELS"/vizkit_motioncommand.zip \
	--subC vizkit_trajectory2:"$SKELS"/vizkit_trajectory2.zip \
	--subC vizkit_motioncommand2:"$SKELS"/vizkit_motioncommand2.zip \
	--subC vizkit_waypoint2:"$SKELS"/vizkit_waypoint2.zip \
	$ORCHESTRATOR_OPTIONS
