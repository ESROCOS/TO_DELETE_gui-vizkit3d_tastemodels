/* This file was generated automatically: DO NOT MODIFY IT ! */

/* Declaration of the functions that have to be provided by the user */

#ifndef __USER_CODE_H_test_range__
#define __USER_CODE_H_test_range__

#include "C_ASN1_Types.h"

#ifdef __cplusplus
extern "C" {
#endif

void test_range_startup();

void test_range_PI_trigger();

extern void test_range_RI_updatePointCloud(const asn1SccPointcloud *);

extern void test_range_RI_updateDepthMap(const asn1SccDepthMap *);

extern void test_range_RI_updatePose_DM(const asn1SccRigidBodyState *);

extern void test_range_RI_updateLaserScan(const asn1SccLaserScan *);

extern void test_range_RI_updatePose_LS(const asn1SccRigidBodyState *);

extern void test_range_RI_updateSonarBeam(const asn1SccSonarBeam *);

extern void test_range_RI_updateOrientation_Sonar(const asn1SccRigidBodyState *);

#ifdef __cplusplus
}
#endif


#endif
