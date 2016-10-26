/* User code: This file will not be overwritten by TASTE. */

#include "vizkit_sonarbeam.h"

/* Function static data is declared in this file : */
#include "Context-vizkit-sonarbeam.h"

#include "vizkit3d_c/vizkit3d_c.h"
#include "vizkit3d_c/sonarBeamPluginWrapper.h"
#include <stdio.h>

int g_statusOk = 0; // flag to avoid calling vizkit3d if instance not initialized or failed

void vizkit_sonarbeam_startup()
{
    int result;
    
    // Initialize Vizkit with the configuration file defined as context parameter
    // - only the first function to call this does actually initialize vizkit3d
    // - only one configuration file can be set per vizkit3d instance
    result = initializeVizkitOnce(vizkit_sonarbeam_ctxt.configfile);

    if (VIZTASTE_OK != result)
    {
        fprintf(stderr, "vizkit_SonarBeam block initialization error (code %d)\n", result);
        g_statusOk = 0;
    }
    else
    {
        g_statusOk = 1;
    }
}

void vizkit_sonarbeam_PI_updateSonarBeam(const asn1SccSonarBeam *IN_beam)
{
    int result;
    
    if (g_statusOk)
    {
        result = SonarBeamVisualization_updateSonarBeam(vizkit_sonarbeam_ctxt.id, IN_beam);
        
        if (VIZTASTE_TERMINATED == result)
        {
            fprintf(stderr, "vizkit_SonarBeam block terminated - stopping update\n");
            g_statusOk = 0;
        }
        else if (VIZTASTE_OK != result)
        {
            fprintf(stderr, "vizkit_SonarBeam block error (code %d) - stopping update\n", result);
            g_statusOk = 0;
        }
    }
}

void vizkit_sonarbeam_PI_updateOrientation(const asn1SccRigidBodyState *IN_state)
{
    int result;
    
    if (g_statusOk)
    {
        result = SonarBeamVisualization_updateOrientation(vizkit_sonarbeam_ctxt.id, IN_state);
        
        if (VIZTASTE_TERMINATED == result)
        {
            fprintf(stderr, "vizkit_SonarBeam block terminated - stopping update\n");
            g_statusOk = 0;
        }
        else if (VIZTASTE_OK != result)
        {
            fprintf(stderr, "vizkit_SonarBeam block error (code %d) - stopping update\n", result);
            g_statusOk = 0;
        }
    }
}

