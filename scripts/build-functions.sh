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

cd $FUNCTIONS_DIR/bodystate || exit_on_error

echo "Running TASTE build script..."
DISABLE_MULTICORE_CHECK=1 USEPOHIC=1 ./build-script.sh || exit_on_error
./copy-exports.sh || exit_on_error

echo "[END] Body state visualization functions"
echo "[START] Range visualization functions"

cd $OLD_DIR || exit_on_error
cd $FUNCTIONS_DIR/range || exit_on_error

echo "Running TASTE build script..."
DISABLE_MULTICORE_CHECK=1 USEPOHIC=1 ./build-script.sh || exit_on_error
./copy-exports.sh || exit_on_error

echo "[END] Range visualization functions"
echo "[START] Trajectory visualization functions"

cd $OLD_DIR || exit_on_error
cd $FUNCTIONS_DIR/trajectory || exit_on_error

echo "Running TASTE build script..."
DISABLE_MULTICORE_CHECK=1 USEPOHIC=1 ./build-script.sh || exit_on_error
./copy-exports.sh || exit_on_error

echo "[END] Trajectory visualization functions"
echo "[START] Robot visualization functions"

cd $OLD_DIR || exit_on_error
cd $FUNCTIONS_DIR/robot || exit_on_error

echo "Running TASTE build script..."
DISABLE_MULTICORE_CHECK=1 USEPOHIC=1 ./build-script.sh || exit_on_error
./copy-exports.sh || exit_on_error

echo "[END] Robot visualization functions"

cd $OLD_DIR

echo "[END] Building $PACKAGE"

exit 0
