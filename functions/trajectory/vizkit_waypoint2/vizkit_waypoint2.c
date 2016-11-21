/* User code: This file will not be overwritten by TASTE. */

#include "vizkit_waypoint2.h"

/* Function static data is declared in this file : */
#include "Context-vizkit-waypoint2.h"

#include "vizkit3d_c/vizkit3d_c.h"
#include "vizkit3d_c/waypointPluginWrapper.h"
#include <stdio.h>

int g_statusOk = 0; // flag to avoid calling vizkit3d if instance not initialized or failed

void vizkit_waypoint2_startup()
{
    int result;
    
    // Initialize Vizkit with the configuration file defined as context parameter
    // - only the first function to call this does actually initialize vizkit3d
    // - only one configuration file can be set per vizkit3d instance
    result = initializeVizkitOnce(vizkit_waypoint2_ctxt.configfile);

    if (VIZTASTE_OK != result)
    {
        fprintf(stderr, "vizkit_Waypoint block initialization error (code %d)\n", result);
        g_statusOk = 0;
    }
    else
    {
        g_statusOk = 1;
    }
}

void vizkit_waypoint2_PI_updateWaypoint(const asn1SccWaypoint *IN_waypoint)
{
    int result;
    
    if (g_statusOk)
    {
        result = WaypointVisualization_updateWaypoint(vizkit_waypoint2_ctxt.id, IN_waypoint);
        
        if (VIZTASTE_TERMINATED == result)
        {
            fprintf(stderr, "vizkit_Waypoint block terminated - stopping update\n");
            g_statusOk = 0;
        }
        else if (VIZTASTE_OK != result)
        {
            fprintf(stderr, "vizkit_Waypoint block error (code %d) - stopping update\n", result);
            g_statusOk = 0;
        }
    }
}

