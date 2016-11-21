#!/bin/bash

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
#  Run the taste/vizkit3d tests.
#  Usage:
#  # run-tests.sh <TASTE_VIZKIT3D_DIR>
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

cd $BASE_DIR/functions/bodystate || exit_on_error
./make-links.sh || exit_on_error
taskset -c 0 ./binary.c/binaries/x86_partition &
PID=$!
exit_on_error
sleep 1
read -n 1 -s -p "Press any key to end test"
echo ""
kill $PID
cd $OLD_DIR || exit_on_error

echo "[END] Test of bodystate visualization functions"
echo "[START] Test of range visualization functions"

cd $BASE_DIR/functions/range || exit_on_error
./make-links.sh || exit_on_error
taskset -c 0 ./binary.c/binaries/x86_partition &
PID=$!
exit_on_error
sleep 1
read -n 1 -s -p "Press any key to end test"
echo ""
kill $PID
cd $OLD_DIR || exit_on_error

echo "[END] Test of range visualization functions"
echo "[START] Test of trajectory visualization functions"

cd $BASE_DIR/functions/trajectory || exit_on_error
./make-links.sh || exit_on_error
taskset -c 0 ./binary.c/binaries/x86_partition &
PID=$!
exit_on_error
sleep 1
read -n 1 -s -p "Press any key to end test"
echo ""
kill $PID
cd $OLD_DIR || exit_on_error

echo "[END] Test of trajectory visualization functions"
echo "[START] Test of robot visualization functions"

cd $BASE_DIR/functions/robot || exit_on_error
./make-links.sh || exit_on_error
taskset -c 0 ./binary.c/binaries/x86_partition &
PID=$!
exit_on_error
sleep 1
read -n 1 -s -p "Press any key to end test"
echo ""
kill $PID
cd $OLD_DIR || exit_on_error

echo "[END] Test of robot visualization functions"

cd $OLD_DIR

echo "[END] Running the $PACKAGE tests"

exit 0
