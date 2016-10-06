#!/bin/bash

export FILES="
$SARGON_CURRENT_ROOT/asn1-types/asn/base/Angle.asn \
$SARGON_CURRENT_ROOT/asn1-types/asn/base/BodyState.asn \
$SARGON_CURRENT_ROOT/asn1-types/asn/base/Covariance.asn \
$SARGON_CURRENT_ROOT/asn1-types/asn/base/DepthMap.asn \
$SARGON_CURRENT_ROOT/asn1-types/asn/base/Eigen.asn \
$SARGON_CURRENT_ROOT/asn1-types/asn/base/LaserScan.asn \
$SARGON_CURRENT_ROOT/asn1-types/asn/base/Motion2D.asn \
$SARGON_CURRENT_ROOT/asn1-types/asn/base/Point.asn \
$SARGON_CURRENT_ROOT/asn1-types/asn/base/Pointcloud.asn \
$SARGON_CURRENT_ROOT/asn1-types/asn/base/Pose.asn \
$SARGON_CURRENT_ROOT/asn1-types/asn/base/RigidBodyState.asn \
$SARGON_CURRENT_ROOT/asn1-types/asn/base/SonarBeam.asn \
$SARGON_CURRENT_ROOT/asn1-types/asn/base/Time.asn \
$SARGON_CURRENT_ROOT/asn1-types/asn/base/TransformWithCovariance.asn \
$SARGON_CURRENT_ROOT/asn1-types/asn/base/TwistWithCovariance.asn \
$SARGON_CURRENT_ROOT/asn1-types/asn/base/Waypoint.asn \
$SARGON_CURRENT_ROOT/asn1-types/asn/base/taste-types.asn \
$SARGON_CURRENT_ROOT/asn1-types/asn/base/taste-extended.asn \
$SARGON_CURRENT_ROOT/asn1-types/asn/sargon/vizkit/VizkitPlugins.asn \
"

for f in $FILES
do
    echo "Importing types from $f"
done

asn2aadlPlus -aadlv2 $FILES DataView.aadl
