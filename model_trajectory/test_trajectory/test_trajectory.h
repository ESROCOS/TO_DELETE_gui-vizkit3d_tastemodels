/* This file was generated automatically: DO NOT MODIFY IT ! */

/* Declaration of the functions that have to be provided by the user */

#ifndef __USER_CODE_H_test_trajectory__
#define __USER_CODE_H_test_trajectory__

#include "C_ASN1_Types.h"

#ifdef __cplusplus
extern "C" {
#endif

void test_trajectory_startup();

void test_trajectory_PI_trigger();

extern void test_trajectory_RI_updateTrajectory(const asn1SccVector3d *);

extern void test_trajectory_RI_updateWaypoint(const asn1SccWaypoint *);

extern void test_trajectory_RI_updateMotionCommand(const asn1SccMotion2D *);

extern void test_trajectory_RI_updatePose(const asn1SccPose *);

extern void test_trajectory_RI_updateMotionCommand2(const asn1SccMotion2D *);

extern void test_trajectory_RI_updatePose2(const asn1SccPose *);

extern void test_trajectory_RI_updateWaypoint2(const asn1SccWaypoint *);

extern void test_trajectory_RI_updateTrajectory2(const asn1SccVector3d *);

#ifdef __cplusplus
}
#endif


#endif
