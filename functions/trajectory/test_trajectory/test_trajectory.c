/* User code: This file will not be overwritten by TASTE. */

#include "test_trajectory.h"

#include "asn1_types_support/asn1SccUtils.h"
#include <math.h>

// Globals
int i;
asn1SccVector3d tv;
asn1SccWaypoint wp;
asn1SccMotion2D cmd;
asn1SccPose pose;
asn1SccVector3d zAxis;


void test_trajectory_startup()
{
    // Trajectory vector
    tv = Vector3d_create(0.0, 0.0, 0.0);

    // Waypoint
    wp.position = Vector3d_create(0.0, 0.0, 0.0);
    wp.heading = M_PI / 3.0;
    wp.tol_position = 0.0;
    wp.tol_heading = 0.0;

    // Motion command and pose
    cmd.translation = 0.1;
    cmd.rotation = 0.0;
    
    zAxis = Vector3d_create(0.0, 0.0, 1.0);
    pose.a_position = Vector3d_create(0.0, 0.0, 0.0);
    pose.a_orientation =  Orientation_angleAxis(M_PI / 3.0, &zAxis);
}

void test_trajectory_PI_trigger()
{
    // Trajectory
    tv.arr[0] = i/100.0;
    tv.arr[1] = i/50.0;
    test_trajectory_RI_updateTrajectory(&tv);
    
    // Waypoint
    if (0 == i % 100)
    {
        wp.position.arr[0] = (i+100)/100.0;
        wp.position.arr[1] = (i+100)/50.0;
        test_trajectory_RI_updateWaypoint(&wp);
    }
    
    // Motion command
    if (0 == i % 100)
    {
        pose.a_position.arr[0] = i/100.0;
        pose.a_position.arr[1] = i/50.0;
        test_trajectory_RI_updateMotionCommand(&cmd);
        test_trajectory_RI_updatePose(&pose);
    }
    
    i++;
}

