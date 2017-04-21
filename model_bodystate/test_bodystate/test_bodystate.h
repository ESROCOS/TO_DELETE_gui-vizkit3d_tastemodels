/* This file was generated automatically: DO NOT MODIFY IT ! */

/* Declaration of the functions that have to be provided by the user */

#ifndef __USER_CODE_H_test_bodystate__
#define __USER_CODE_H_test_bodystate__

#include "C_ASN1_Types.h"

#ifdef __cplusplus
extern "C" {
#endif

void test_bodystate_startup();

void test_bodystate_PI_trigger();

extern void test_bodystate_RI_updateRigidBodyState(const asn1SccRigidBodyState *);

extern void test_bodystate_RI_updateBodyState(const asn1SccBodyState *);

#ifdef __cplusplus
}
#endif


#endif
