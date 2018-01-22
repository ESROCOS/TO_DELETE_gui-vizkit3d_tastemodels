/* User code: This file will not be overwritten by TASTE. */

#include "test_range.h"

#include "base_support/baseUtils.h"
#include <math.h>
#include <stddef.h>
#include <stdio.h>

// Globals
int i;
asn1SccPointcloud cloud;
asn1SccDepthMap map;
asn1SccLaserScan scan;
asn1SccRigidBodyState pose;
asn1SccVector3d zAxis;
asn1SccRigidBodyState sonarPose;


const char* sonarDataFile = "sonar_beam.data";
#define maxSonarData 10000
asn1SccSonarBeam* sonarData[maxSonarData];

void test_range_startup()
{
    int j;
    
    i = 0;
    
    // Point cloud
    cloud.points.nCount = 36;
    cloud.colors.nCount = 0;

    // Depth map
    map.vertical_projection = asn1Sccplanar;
    map.horizontal_projection = asn1Sccplanar;
    map.vertical_size = 6;
    map.horizontal_size = 6;
    map.vertical_interval.nCount = 6;
    map.horizontal_interval.nCount = 6;
    for (j = 0; j < 6; j++)
    {
        map.vertical_interval.arr[j] = j * 0.1;
        map.horizontal_interval.arr[j] = j * 0.1;
    }
    
    // Laser scan
    scan.start_angle = -M_PI_4;
    scan.angular_resolution = M_PI / 60.0;
    scan.speed = 1.0;
    scan.minRange = 0.1;
    scan.maxRange = 1000.0;
    
    // Sonar beam
    sonarPose.orient = Orientation_create(0.707, 0.0, 0.707, 0.0);
    size_t count = readSonarBeamFile(sonarDataFile, sonarData, maxSonarData);
    if (count > 0)
    {
        printf("Read sonar data: %d entries.\n", count);
        printf("Enable KeepOldData manually.\n");
    }
    else
    {
        printf("Cannot read sonar data.\n");
    }

    // Pose of depth map an laser scan (same pose, different frame)
    zAxis = Vector3d_create(0.0, 0.0, 1.0);
}

void test_range_PI_trigger()
{
    int j, k;
    static int sonarCount = 0;
    
    // Point cloud
    for (j = 0; j < 6; j++)
    {
        for (k = 0; k < 6; k++)
        {
            cloud.points.arr[6*j+k] = Vector3d_create(i/1000.0, j/10.0, k/10.0);
        }
    }
    test_range_RI_updatePointCloud(&cloud);

    // Depth map
    map.distances.nCount = 36;
    for (j = 0; j < map.distances.nCount ; j++)
    {
        map.distances.arr[j] = i/1000.0;
    }
    test_range_RI_updateDepthMap(&map);
    
    // Laser scan
    scan.ranges.nCount = 30;
    for (j = 0; j < scan.ranges.nCount; j++)
    {
        scan.ranges.arr[j] = i+j;
    }
    test_range_RI_updateLaserScan(&scan);
    
    // Sonar
    if (NULL != sonarData[sonarCount % maxSonarData])
    {
        test_range_RI_updateOrientation_Sonar(&sonarPose);
        test_range_RI_updateSonarBeam(sonarData[sonarCount++ % maxSonarData]);
    }

    // Pose
    pose.orient = Orientation_angleAxis(i*M_PI/180.0, &zAxis);
    test_range_RI_updatePose_DM(&pose);
    test_range_RI_updatePose_LS(&pose);

    i++;
}

