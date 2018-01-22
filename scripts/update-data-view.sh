#!/bin/sh

export FILES="
$AUTOPROJ_CURRENT_ROOT/install/types/base/*.asn \
$AUTOPROJ_CURRENT_ROOT/install/types/sensor_samples/*.asn \
$AUTOPROJ_CURRENT_ROOT/install/types/core/asn/vizkit3d/Vizkit3D.asn \
"

echo "Updating DataView.aadl"

taste-update-data-view $FILES

