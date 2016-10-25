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
#  Install the cameraviz files.
#  Usage:
#  # build-tests.sh <CAMERAVIZ_DIR> <INSTALL_BASE_DIR>
# ..................................................................
#  HISTORY
#  $History$
#
# ======================================================================

# Helper exit function
exit_on_error() {
    rc=$?
    if [ $rc != 0 ] ; then
        echo "ERROR $rc" 1>&2
        exit $rc
    fi
}

# Definitions
BASE_DIR=$1
INSTALL_DIR=$2
PACKAGE="taste/vizkit3d"
EXPORT_DIR=$BASE_DIR/export
TARGET_DIR=$INSTALL_DIR/share/$PACKAGE

echo "Installing $PACKAGE in $TARGET_DIR"

mkdir -p $TARGET_DIR
exit_on_error

cp $EXPORT_DIR/* $TARGET_DIR
exit_on_error

exit 0
