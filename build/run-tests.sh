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
PACKAGE="vizkit-taste"
TESTS_DIR=$BASE_DIR/functions

echo "Running the $PACKAGE test in $TESTS_DIR"

cd $TESTS_DIR
taskset -c 0 ./binary.c/binaries/x86_partition
exit_on_error

cd $OLD_DIR

exit 0
