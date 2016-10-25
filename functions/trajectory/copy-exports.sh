#!/bin/sh

if [ InterfaceView.aadl -nt export_vizkit_Trajectory.aadl ] ; then
    echo "Interface View model is newer than export_vizkit_Trajectory.aadl. Redo export."
    exit 1
fi

if [ InterfaceView.aadl -nt export_vizkit_Waypoint.aadl ] ; then
    echo "Interface View model is newer than export_vizkit_Waypoint.aadl. Redo export."
    exit 1
fi

echo "Copying export files"

cp export_vizkit_Trajectory.aadl \
   export_vizkit_Waypoint.aadl \
   vizkit_trajectory.zip \
   vizkit_waypoint.zip \
   update-data-view.sh \
   ../../export/

