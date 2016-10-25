#!/bin/sh

if [ InterfaceView.aadl -nt export_vizkit_DepthMap.aadl ] ; then
    echo "Interface View model is newer than export_vizkit_DepthMap.aadl. Redo export."
    exit 1
fi

if [ InterfaceView.aadl -nt export_vizkit_LaserScan.aadl ] ; then
    echo "Interface View model is newer than export_vizkit_LaserScan.aadl. Redo export."
    exit 1
fi

if [ InterfaceView.aadl -nt export_vizkit_Pointcloud.aadl ] ; then
    echo "Interface View model is newer than export_vizkit_Pointcloud.aadl. Redo export."
    exit 1
fi

if [ InterfaceView.aadl -nt export_vizkit_SonarBeam.aadl ] ; then
    echo "Interface View model is newer than export_vizkit_SonarBeam.aadl. Redo export."
    exit 1
fi

echo "Copying export files"

EXPORT_DIR=../../export

mkdir -p $EXPORT_DIR

cp export_vizkit_DepthMap.aadl \
   export_vizkit_LaserScan.aadl \
   export_vizkit_SonarBeam.aadl \
   export_vizkit_Pointcloud.aadl \
   vizkit_depthmap.zip \
   vizkit_laserscan.zip \
   vizkit_pointcloud.zip \
   vizkit_sonarbeam.zip \
   update-data-view.sh \
   $EXPORT_DIR

