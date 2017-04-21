/* User code: This file will not be overwritten by TASTE. */

#include "vizkit_trajectory2.h"

/* Function static data is declared in this file : */
#include "Context-vizkit-trajectory2.h"

#include "vizkit3d_c/vizkit3d_c.h"
#include "vizkit3d_c/trajectoryPluginWrapper.h"
#include <stdio.h>

int g_statusOk = 0; // flag to avoid calling vizkit3d if instance not initialized or failed

void vizkit_trajectory2_startup()
{
    int result;
    
    // Initialize Vizkit with the configuration file defined as context parameter
    // - only the first function to call this does actually initialize vizkit3d
    // - only one configuration file can be set per vizkit3d instance
    result = initializeVizkitOnce(vizkit_trajectory2_ctxt.configfile);

    if (VIZTASTE_OK != result)
    {
        fprintf(stderr, "vizkit_Trajectory block initialization error (code %d)\n", result);
        g_statusOk = 0;
    }
    else
    {
        g_statusOk = 1;
    }
}

void vizkit_trajectory2_PI_updateTrajectory(const asn1SccVector3d *IN_point)
{
    int result;
    
    if (g_statusOk)
    {
        result = TrajectoryVisualization_updateTrajectory(vizkit_trajectory2_ctxt.id, IN_point);
        
        if (VIZTASTE_TERMINATED == result)
        {
            fprintf(stderr, "vizkit_Trajectory block terminated - stopping update\n");
            g_statusOk = 0;
        }
        else if (VIZTASTE_OK != result)
        {
            fprintf(stderr, "vizkit_Trajectory block error (code %d) - stopping update\n", result);
            g_statusOk = 0;
        }
    }
}

