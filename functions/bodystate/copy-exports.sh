#!/bin/sh

if [ InterfaceView.aadl -nt export_vizkit_RigidBodyState.aadl ] ; then
    echo "Interface View model is newer than export_vizkit_RigidBodyState.aadl. Redo export."
    exit 1
fi

if [ InterfaceView.aadl -nt export_vizkit_BodyState.aadl ] ; then
    echo "Interface View model is newer than export_vizkit_BodyState.aadl. Redo export."
    exit 1
fi

echo "Copying export files"

cp export_vizkit_RigidBodyState.aadl \
   export_vizkit_BodyState.aadl \
   vizkit_rigidbodystate.zip \
   vizkit_bodystate.zip \
   update-data-view.sh \
   ../../export/

