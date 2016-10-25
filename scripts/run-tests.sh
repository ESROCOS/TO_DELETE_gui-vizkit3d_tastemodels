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
#  Run the cameraviz test.
#  Usage:
#  # build-tests.sh <CAMERAVIZ_DIR>
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

echo "[START] Running the $PACKAGE tests"

echo "[START] Test of bodystate functions"

cd $BASE_DIR/functions/bodystate
taskset -c 0 ./binary.c/binaries/x86_partition &
exit_on_error
cd $OLD_DIR

echo "[END] Test of bodystate functions"

echo "[START] Test of range functions"

cd $BASE_DIR/functions/range
taskset -c 0 ./binary.c/binaries/x86_partition &
exit_on_error
cd $OLD_DIR

echo "[END] Test of range functions"

echo "[START] Test of trajectory functions"

cd $BASE_DIR/functions/trajectory
taskset -c 0 ./binary.c/binaries/x86_partition &
exit_on_error
cd $OLD_DIR

echo "[END] Test of trajectory functions"

echo "Close window and press Ctrl+C to end tests"

cd $OLD_DIR

exit 0
