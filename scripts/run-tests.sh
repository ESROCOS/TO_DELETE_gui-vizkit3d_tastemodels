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

echo "[START] Test of bodystate visualization functions"

cd $BASE_DIR/functions/bodystate
./make-links.sh
taskset -c 0 ./binary.c/binaries/x86_partition &
exit_on_error
cd $OLD_DIR

echo "[END] Test of bodystate visualization functions"
echo "[START] Test of range visualization functions"

cd $BASE_DIR/functions/range
./make-links.sh
taskset -c 0 ./binary.c/binaries/x86_partition &
exit_on_error
cd $OLD_DIR

echo "[END] Test of range visualization functions"
echo "[START] Test of trajectory visualization functions"

cd $BASE_DIR/functions/trajectory
./make-links.sh
taskset -c 0 ./binary.c/binaries/x86_partition &
exit_on_error
cd $OLD_DIR

echo "[END] Test of trajectory visualization functions"
echo "[START] Test of robot visualization functions"

cd $BASE_DIR/functions/robot
./make-links.sh
taskset -c 0 ./binary.c/binaries/x86_partition &
exit_on_error
cd $OLD_DIR

echo "[END] Test of robot visualization functions"

echo "Close window and press Ctrl+C to end tests"

cd $OLD_DIR

echo "[END] Running the $PACKAGE tests"

exit 0
