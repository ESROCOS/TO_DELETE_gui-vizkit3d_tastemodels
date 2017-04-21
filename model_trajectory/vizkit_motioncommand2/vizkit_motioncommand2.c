/* User code: This file will not be overwritten by TASTE. */

#include "vizkit_motioncommand2.h"

/* Function static data is declared in this file : */
#include "Context-vizkit-motioncommand2.h"

#include "vizkit3d_c/vizkit3d_c.h"
#include "vizkit3d_c/motionCommandPluginWrapper.h"
#include <stdio.h>

int g_statusOk = 0; // flag to avoid calling vizkit3d if instance not initialized or failed

void vizkit_motioncommand2_startup()
{
    int result;
    
    // Initialize Vizkit with the configuration file defined as context parameter
    // - only the first function to call this does actually initialize vizkit3d
    // - only one configuration file can be set per vizkit3d instance
    result = initializeVizkitOnce(vizkit_motioncommand2_ctxt.configfile);

    if (VIZTASTE_OK != result)
    {
        fprintf(stderr, "vizkit_MotionCommand block initialization error (code %d)\n", result);
        g_statusOk = 0;
    }
    else
    {
        g_statusOk = 1;
    }
}

void vizkit_motioncommand2_PI_updateMotionCommand(const asn1SccMotion2D *IN_command)
{
    int result;
    
    if (g_statusOk)
    {
        result = MotionCommandVisualization_updateMotionCommand(vizkit_motioncommand2_ctxt.id, IN_command);
        
        if (VIZTASTE_TERMINATED == result)
        {
            fprintf(stderr, "vizkit_MotionCommand block terminated - stopping update\n");
            g_statusOk = 0;
        }
        else if (VIZTASTE_OK != result)
        {
            fprintf(stderr, "vizkit_MotionCommand block error (code %d) - stopping update\n", result);
            g_statusOk = 0;
        }
    }
}

void vizkit_motioncommand2_PI_updatePose(const asn1SccPose *IN_pose)
{
    int result;
    
    if (g_statusOk)
    {
        result = MotionCommandVisualization_updatePose(vizkit_motioncommand2_ctxt.id, IN_pose);
        
        if (VIZTASTE_TERMINATED == result)
        {
            fprintf(stderr, "vizkit_MotionCommand block terminated - stopping update\n");
            g_statusOk = 0;
        }
        else if (VIZTASTE_OK != result)
        {
            fprintf(stderr, "vizkit_MotionCommand block error (code %d) - stopping update\n", result);
            g_statusOk = 0;
        }
    }
}

