#!/bin/sh

export FILES="
$AUTOPROJ_CURRENT_ROOT/base/taste/asn1_types/asn/base/Angle.asn \
$AUTOPROJ_CURRENT_ROOT/base/taste/asn1_types/asn/base/BodyState.asn \
$AUTOPROJ_CURRENT_ROOT/base/taste/asn1_types/asn/base/Covariance.asn \
$AUTOPROJ_CURRENT_ROOT/base/taste/asn1_types/asn/base/DepthMap.asn \
$AUTOPROJ_CURRENT_ROOT/base/taste/asn1_types/asn/base/Eigen.asn \
$AUTOPROJ_CURRENT_ROOT/base/taste/asn1_types/asn/base/LaserScan.asn \
$AUTOPROJ_CURRENT_ROOT/base/taste/asn1_types/asn/base/Motion2D.asn \
$AUTOPROJ_CURRENT_ROOT/base/taste/asn1_types/asn/base/Point.asn \
$AUTOPROJ_CURRENT_ROOT/base/taste/asn1_types/asn/base/Pointcloud.asn \
$AUTOPROJ_CURRENT_ROOT/base/taste/asn1_types/asn/base/Pose.asn \
$AUTOPROJ_CURRENT_ROOT/base/taste/asn1_types/asn/base/RigidBodyState.asn \
$AUTOPROJ_CURRENT_ROOT/base/taste/asn1_types/asn/base/SonarBeam.asn \
$AUTOPROJ_CURRENT_ROOT/base/taste/asn1_types/asn/base/Time.asn \
$AUTOPROJ_CURRENT_ROOT/base/taste/asn1_types/asn/base/TransformWithCovariance.asn \
$AUTOPROJ_CURRENT_ROOT/base/taste/asn1_types/asn/base/TwistWithCovariance.asn \
$AUTOPROJ_CURRENT_ROOT/base/taste/asn1_types/asn/base/Waypoint.asn \
$AUTOPROJ_CURRENT_ROOT/base/taste/asn1_types/asn/base/taste-types.asn \
$AUTOPROJ_CURRENT_ROOT/base/taste/asn1_types/asn/base/taste-extended.asn \
$AUTOPROJ_CURRENT_ROOT/base/taste/asn1_types/asn/sargon/vizkit/VizkitPlugins.asn \
"

echo "Updating DataView.aadl"

taste-update-data-view $FILES

