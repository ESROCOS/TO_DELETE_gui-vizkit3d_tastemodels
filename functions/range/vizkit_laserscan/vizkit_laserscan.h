/* This file was generated automatically: DO NOT MODIFY IT ! */

/* Declaration of the functions that have to be provided by the user */

#ifndef __USER_CODE_H_vizkit_laserscan__
#define __USER_CODE_H_vizkit_laserscan__

#include "C_ASN1_Types.h"

#ifdef __cplusplus
extern "C" {
#endif

void vizkit_laserscan_startup();

void vizkit_laserscan_PI_updateLaserScan(const asn1SccLaserScan *);

void vizkit_laserscan_PI_updatePose(const asn1SccRigidBodyState *);

#ifdef __cplusplus
}
#endif


#endif
