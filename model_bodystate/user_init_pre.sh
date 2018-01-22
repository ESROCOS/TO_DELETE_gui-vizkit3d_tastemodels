#!/bin/sh

ORCHESTRATOR_OPTIONS+=" --no-retry"
ORCHESTRATOR_OPTIONS+=" -e x86_partition:$AUTOPROJ_CURRENT_ROOT/install/include"
ORCHESTRATOR_OPTIONS+=" -l x86_partition:$AUTOPROJ_CURRENT_ROOT/install/lib/libvizkit3d_taste.so"
ORCHESTRATOR_OPTIONS+=" -l x86_partition:$AUTOPROJ_CURRENT_ROOT/install/lib/libbase_support.so"

echo "ORCHESTRATOR_OPTIONS=$ORCHESTRATOR_OPTIONS"
