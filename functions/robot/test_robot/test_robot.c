/* User code: This file will not be overwritten by TASTE. */

#include "test_robot.h"

#include "asn1_types_support/asn1SccUtils.h"
#include <math.h>


// Globals
int i = 0;
asn1SccVector3d xAxis;
asn1SccRigidBodyState rbs;
asn1SccJoints joints;
int dir3 = 1;

void test_robot_startup()
{
    i = 0;
    xAxis = Vector3d_create(1.0, 0.0, 0.0);
    
    // Joints: positions of joint_3, joint_4
    asn1SccJointState jz;
    jz.acceleration = 0;
    jz.effort = 0;
    jz.position = 0;
    jz.raw = 0;
    jz.speed = 0;
    
    joints.names.nCount = 2;
    String_fromC(&joints.names.arr[0], "joint_3");
    String_fromC(&joints.names.arr[1], "joint_4");
    
    joints.elements.nCount = 2;
    joints.elements.arr[0] = jz;
    joints.elements.arr[1] = jz;
}

void test_robot_PI_trigger()
{
    // Update RigidBodyState
    rbs.a_orientation = Orientation_angleAxis( i * M_PI * 0.2 / 180.0, &xAxis);
    test_robot_RI_updateRigidBodyState(&rbs);

    // Update Joints
    // joint_3
    double j3pos = joints.elements.arr[0].position;
    j3pos += dir3 * i * M_PI / 10000.0;
    if (abs(j3pos) > 2.3)
    {
        dir3 *= -1;
    }
    joints.elements.arr[0].position = j3pos;
    
    // joint_4
    double j4pos = joints.elements.arr[1].position;
    j4pos = i * M_PI / 50.0;
    j4pos = remainder(j4pos, M_PI);
    joints.elements.arr[1].position = j4pos;

    test_robot_RI_updateJoints(&joints);

    i++;
}

