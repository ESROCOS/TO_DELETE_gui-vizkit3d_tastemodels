/* This file was generated automatically: DO NOT MODIFY IT ! */

/* Declaration of the functions that have to be provided by the user */

#ifndef __USER_CODE_H_vizkit_robot__
#define __USER_CODE_H_vizkit_robot__

#include "C_ASN1_Types.h"

#ifdef __cplusplus
extern "C" {
#endif

void vizkit_robot_startup();

void vizkit_robot_PI_updateRigidBodyState(const asn1SccRigidBodyState *);

void vizkit_robot_PI_updateJoints(const asn1SccJoints *);

#ifdef __cplusplus
}
#endif


#endif
