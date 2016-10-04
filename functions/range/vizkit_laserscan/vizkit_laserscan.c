/* User code: This file will not be overwritten by TASTE. */

#include "vizkit_laserscan.h"

/* Function static data is declared in this file : */
#include "Context-vizkit-laserscan.h"

#include "vizkit-taste/vizkit-taste.h"
#include "vizkit-taste/laserScanPluginWrapper.h"
#include <stdio.h>

int g_statusOk = 0; // flag to avoid calling vizkit3d if instance not initialized or failed

void vizkit_laserscan_startup()
{
    int result;
    
    // Initialize Vizkit with the configuration file defined as context parameter
    // - only the first function to call this does actually initialize vizkit3d
    // - only one configuration file can be set per vizkit3d instance
    result = initializeVizkitOnce(vizkit_laserscan_ctxt.configfile);

    if (VIZTASTE_OK != result)
    {
        fprintf(stderr, "vizkit_LaserScan block initialization error (code %d)\n", result);
        g_statusOk = 0;
    }
    else
    {
        g_statusOk = 1;
    }
}

void vizkit_laserscan_PI_updateLaserScan(const asn1SccLaserScan *IN_scan)
{
    int result;
    
    if (g_statusOk)
    {
        result = LaserScanVisualization_updateLaserScan(vizkit_laserscan_ctxt.id, IN_scan);
        
        if (VIZTASTE_TERMINATED == result)
        {
            fprintf(stderr, "vizkit_LaserScan block terminated - stopping update\n");
            g_statusOk = 0;
        }
        else if (VIZTASTE_OK != result)
        {
            fprintf(stderr, "vizkit_LaserScan block error (code %d) - stopping update\n", result);
            g_statusOk = 0;
        }
    }
}

void vizkit_laserscan_PI_updatePose(const asn1SccRigidBodyState *IN_pose)
{
    int result;
    
    if (g_statusOk)
    {
        result = LaserScanVisualization_updatePose(vizkit_laserscan_ctxt.id, IN_pose);
        
        if (VIZTASTE_TERMINATED == result)
        {
            fprintf(stderr, "vizkit_LaserScan block terminated - stopping update\n");
            g_statusOk = 0;
        }
        else if (VIZTASTE_OK != result)
        {
            fprintf(stderr, "vizkit_LaserScan block error (code %d) - stopping update\n", result);
            g_statusOk = 0;
        }
    }
}

