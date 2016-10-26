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
#  Build the functions directory of taste/vizkit3d.
#  Usage:
#  # build-functions.sh <VIZKIT-TASTE_DIR>
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
        cd $OLD_DIR
        exit $rc
    fi
}

# Definitions
OLD_DIR=`pwd`
BASE_DIR=$1
PACKAGE="taste/vizkit3d"
FUNCTIONS_DIR=$BASE_DIR/functions

echo "[START] Building $PACKAGE in $FUNCTIONS_DIR"

echo "[START] Body state visualization functions"

cd $FUNCTIONS_DIR/bodystate

echo "Running TASTE build script for bodystate"
DISABLE_MULTICORE_CHECK=1 USEPOHIC=1 ./build-script.sh
exit_on_error

./copy-exports.sh
exit_on_error

echo "[END] Body state visualization functions"
echo "[START] Range visualization functions"

cd $OLD_DIR
cd $FUNCTIONS_DIR/range

echo "Running TASTE build script for range"
DISABLE_MULTICORE_CHECK=1 USEPOHIC=1 ./build-script.sh
exit_on_error

./copy-exports.sh
exit_on_error

echo "[END] Range visualization functions"
echo "[START] Trajectory visualization functions"

cd $OLD_DIR
cd $FUNCTIONS_DIR/trajectory

echo "Running TASTE build script for bodystate"
DISABLE_MULTICORE_CHECK=1 USEPOHIC=1 ./build-script.sh
exit_on_error

./copy-exports.sh
exit_on_error

echo "[END] Trajectory visualization functions"

cd $OLD_DIR

echo "[END] Building $PACKAGE in $FUNCTIONS_DIR"

exit 0
