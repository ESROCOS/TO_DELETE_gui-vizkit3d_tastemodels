/* Functions to be filled by the user (never overwritten by buildsupport tool) */

#include "test_bodystate.h"

#include "asn1_types_support/asn1SccUtils.h"
#include <math.h>


// Globals
int i = 0;
asn1SccVector3d xAxis;
asn1SccRigidBodyState rbs;
asn1SccBodyState bs;

void test_bodystate_startup()
{
    i = 0;
    xAxis = Vector3d_create(1.0, 0.0, 0.0);

    // BodyState translation
    bs.pose.translation = Vector3d_create(0.0, 0.0, 0.5);
}

void test_bodystate_PI_trigger()
{
    // Update RigidBodyState
    rbs.a_orientation = Orientation_angleAxis( i * M_PI / 180.0, &xAxis);
    test_bodystate_RI_updateRigidBodyState(&rbs);

    // Update BodyState
    bs.pose.orientation = Orientation_angleAxis(i*M_PI/180.0, &xAxis);
    test_bodystate_RI_updateBodyState(&bs);

    i++;
}

