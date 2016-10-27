#!/bin/sh

# ======================================================================
#  FILE:  $URL$
# ======================================================================
#  PROJECT:             :  SARGON
#  VERSION              :  $Revision$
#  LANGUAGE             :  Shell script
#  AUTHOR               :  $LastChangedBy$ 
#  COPYRIGHT            :  AVOS - GMV,S.A.
#  COMPILER             :  -
#  CREATED              :  $CreationDate$
#  CLASS                :  -
#  LAST MODIFIED        :  $LastChangedDate$
#  GENERATED FROM MODEL :  -
#  ORIGINAL MODEL AUTHOR:  -
#
# ..................................................................
#  Copy exported TASTE functions and related files to the export folder.
# ..................................................................
#  HISTORY
#  $History$
#
# ======================================================================

if [ InterfaceView.aadl -nt export_vizkit_Robot.aadl ] ; then
    echo "Interface View model is newer than export_vizkit_Robot.aadl. Redo export."
    exit 1
fi

echo "Copying export files"

EXPORT_DIR=../../export

mkdir -p $EXPORT_DIR

cp export_vizkit_Robot.aadl \
   vizkit_robot.zip \
   ../../scripts/update-data-view.sh \
   $EXPORT_DIR

