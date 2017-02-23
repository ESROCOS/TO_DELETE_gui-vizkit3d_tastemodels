#!/bin/sh

export FILES="
$AUTOPROJ_CURRENT_ROOT/install/share/taste/asn1_types/base/Angle.asn \
$AUTOPROJ_CURRENT_ROOT/install/share/taste/asn1_types/base/BodyState.asn \
$AUTOPROJ_CURRENT_ROOT/install/share/taste/asn1_types/base/Covariance.asn \
$AUTOPROJ_CURRENT_ROOT/install/share/taste/asn1_types/base/DepthMap.asn \
$AUTOPROJ_CURRENT_ROOT/install/share/taste/asn1_types/base/Eigen.asn \
$AUTOPROJ_CURRENT_ROOT/install/share/taste/asn1_types/base/Joints.asn \
$AUTOPROJ_CURRENT_ROOT/install/share/taste/asn1_types/base/JointState.asn \
$AUTOPROJ_CURRENT_ROOT/install/share/taste/asn1_types/base/LaserScan.asn \
$AUTOPROJ_CURRENT_ROOT/install/share/taste/asn1_types/base/Motion2D.asn \
$AUTOPROJ_CURRENT_ROOT/install/share/taste/asn1_types/base/Point.asn \
$AUTOPROJ_CURRENT_ROOT/install/share/taste/asn1_types/base/Pointcloud.asn \
$AUTOPROJ_CURRENT_ROOT/install/share/taste/asn1_types/base/Pose.asn \
$AUTOPROJ_CURRENT_ROOT/install/share/taste/asn1_types/base/RigidBodyState.asn \
$AUTOPROJ_CURRENT_ROOT/install/share/taste/asn1_types/base/SonarBeam.asn \
$AUTOPROJ_CURRENT_ROOT/install/share/taste/asn1_types/base/Time.asn \
$AUTOPROJ_CURRENT_ROOT/install/share/taste/asn1_types/base/TransformWithCovariance.asn \
$AUTOPROJ_CURRENT_ROOT/install/share/taste/asn1_types/base/TwistWithCovariance.asn \
$AUTOPROJ_CURRENT_ROOT/install/share/taste/asn1_types/base/Waypoint.asn \
$AUTOPROJ_CURRENT_ROOT/install/share/taste/asn1_types/base/taste-types.asn \
$AUTOPROJ_CURRENT_ROOT/install/share/taste/asn1_types/base/taste-extended.asn \
$AUTOPROJ_CURRENT_ROOT/install/share/taste/asn1_types/sargon/vizkit3d/Vizkit3D.asn \
"

echo "Updating DataView.aadl"

taste-update-data-view $FILES

