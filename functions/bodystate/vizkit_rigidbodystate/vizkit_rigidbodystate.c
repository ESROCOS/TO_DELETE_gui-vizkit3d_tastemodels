/* Functions to be filled by the user (never overwritten by buildsupport tool) */

#include "vizkit_rigidbodystate.h"

/* Function static data is declared in this file : */
#include "Context-vizkit-rigidbodystate.h"

#include "vizkit-taste/vizkit-taste.h"
#include "vizkit-taste/rigidBodyStatePluginWrapper.h"
#include <stdio.h>

int g_statusOk = 0; // flag to avoid calling vizkit3d if instance not initialized or failed

void vizkit_rigidbodystate_startup()
{
    int result;
    
    // Initialize Vizkit with the configuration file defined as context parameter
    // - only the first function to call this does actually initialize vizkit3d
    // - only one configuration file can be set per vizkit3d instance
    result = initializeVizkitOnce(vizkit_rigidbodystate_ctxt.configfile);

    if (VIZTASTE_OK != result)
    {
        fprintf(stderr, "vizkit_RigidBodyState block initialization error (code %d)\n", result);
        g_statusOk = 0;
    }
    else
    {
        g_statusOk = 1;
    }
}

void vizkit_rigidbodystate_PI_updateRigidBodyState(const asn1SccRigidBodyState* IN_state)
{
    int result;
    
    if (g_statusOk)
    {
        result = RigidBodyStateVisualization_updateRigidBodyState(vizkit_rigidbodystate_ctxt.id, IN_state);
        
        if (VIZTASTE_TERMINATED == result)
        {
            fprintf(stderr, "vizkit_RigidBodyState block terminated - stopping update\n");
            g_statusOk = 0;
        }
        else if (VIZTASTE_OK != result)
        {
            fprintf(stderr, "vizkit_RigidBodyState block error (code %d) - stopping update\n", result);
            g_statusOk = 0;
        }
    }
}

