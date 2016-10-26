/* User code: This file will not be overwritten by TASTE. */

#include "vizkit_depthmap.h"

/* Function static data is declared in this file : */
#include "Context-vizkit-depthmap.h"

#include "vizkit3d_c/vizkit3d_c.h"
#include "vizkit3d_c/depthMapPluginWrapper.h"
#include <stdio.h>

int g_statusOk = 0; // flag to avoid calling vizkit3d if instance not initialized or failed

void vizkit_depthmap_startup()
{
    int result;
    
    // Initialize Vizkit with the configuration file defined as context parameter
    // - only the first function to call this does actually initialize vizkit3d
    // - only one configuration file can be set per vizkit3d instance
    result = initializeVizkitOnce(vizkit_depthmap_ctxt.configfile);

    if (VIZTASTE_OK != result)
    {
        fprintf(stderr, "vizkit_DepthMap block initialization error (code %d)\n", result);
        g_statusOk = 0;
    }
    else
    {
        g_statusOk = 1;
    }
}

void vizkit_depthmap_PI_updateDepthMap(const asn1SccDepthMap *IN_map)
{
    int result;
    
    if (g_statusOk)
    {
        result = DepthMapVisualization_updateDepthMap(vizkit_depthmap_ctxt.id, IN_map);
        
        if (VIZTASTE_TERMINATED == result)
        {
            fprintf(stderr, "vizkit_DepthMap block terminated - stopping update\n");
            g_statusOk = 0;
        }
        else if (VIZTASTE_OK != result)
        {
            fprintf(stderr, "vizkit_DepthMap block error (code %d) - stopping update\n", result);
            g_statusOk = 0;
        }
    }
}

void vizkit_depthmap_PI_updatePose(const asn1SccRigidBodyState *IN_pose)
{
    int result;
    
    if (g_statusOk)
    {
        result = DepthMapVisualization_updatePose(vizkit_depthmap_ctxt.id, IN_pose);
        
        if (VIZTASTE_TERMINATED == result)
        {
            fprintf(stderr, "vizkit_DepthMap block terminated - stopping update\n");
            g_statusOk = 0;
        }
        else if (VIZTASTE_OK != result)
        {
            fprintf(stderr, "vizkit_DepthMap block error (code %d) - stopping update\n", result);
            g_statusOk = 0;
        }
    }
}

