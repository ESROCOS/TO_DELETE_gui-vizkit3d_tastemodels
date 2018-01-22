/* User code: This file will not be overwritten by TASTE. */

#include "vizkit_bodystate.h"

/* Function static data is declared in this file : */
#include "Context-vizkit-bodystate.h"

#include "vizkit3d_taste/vizkit3d_taste.h"
#include <stdio.h>

int g_statusOk = 0; // flag to avoid calling vizkit3d if instance not initialized or failed

void vizkit_bodystate_startup()
{
    int result;
    
    // Initialize Vizkit with the configuration file defined as context parameter
    // - only the first function to call this does actually initialize vizkit3d
    // - only one configuration file can be set per vizkit3d instance
    result = initializeVizkitOnce(vizkit_bodystate_ctxt.configfile);

    if (VIZTASTE_OK != result)
    {
        fprintf(stderr, "vizkit_BodyState block initialization error (code %d)\n", result);
        g_statusOk = 0;
    }
    else
    {
        g_statusOk = 1;
    }
}

void vizkit_bodystate_PI_updateBodyState(const asn1SccBodyState *IN_state)
{
    int result;
    
    if (g_statusOk)
    {
        result = BodyStateVisualization_updateBodyState(vizkit_bodystate_ctxt.id, IN_state);
        
        if (VIZTASTE_TERMINATED == result)
        {
            fprintf(stderr, "vizkit_BodyState block terminated - stopping update\n");
            g_statusOk = 0;
        }
        else if (VIZTASTE_OK != result)
        {
            fprintf(stderr, "vizkit_BodyState block error (code %d) - stopping update\n", result);
            g_statusOk = 0;
        }
    }
}

