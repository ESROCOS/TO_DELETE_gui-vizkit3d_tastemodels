# ======================================================================
#  FILE:  $URL$
# ======================================================================
#  PROJECT:             :  SARGON
#  VERSION              :  $Revision$
#  LANGUAGE             :  CMake script
#  AUTHOR               :  $LastChangedBy$ 
#  COPYRIGHT            :  AVOS - GMV,S.A.
#  COMPILER             :  cmake version 3.0.2
#  CREATED              :  $CreationDate$
#  CLASS                :  -
#  LAST MODIFIED        :  $LastChangedDate$
#  GENERATED FROM MODEL :  -
#  ORIGINAL MODEL AUTHOR:  -
# ----------------------------------------------------------------------
#  CMake build script for the vizkit-taste library
# ----------------------------------------------------------------------
#  HISTORY
#  $History$
# ======================================================================

sargon_find_qt4()
sargon_find_pkgconfig(Eigen3 eigen3 REQUIRED)

set(SOURCES
    BodyStatePluginController.cpp
    ConfigurationReader.cpp
    DepthMapPluginController.cpp
    GridPluginController.cpp
    LaserScanPluginController.cpp
    ModelPluginController.cpp
    MotionCommandPluginController.cpp
    PluginController.cpp
    PointcloudPluginController.cpp
    RigidBodyStatePluginController.cpp
    SonarBeamPluginController.cpp
    TextureBoxPluginController.cpp
    TrajectoryPluginController.cpp
    VizkitInstance.cpp
    WaypointPluginController.cpp
    bodyStatePluginWrapper.cpp
    depthMapPluginWrapper.cpp
    laserScanPluginWrapper.cpp
    motionCommandPluginWrapper.cpp
    pointcloudPluginWrapper.cpp
    rigidBodyStatePluginWrapper.cpp
    sonarBeamPluginWrapper.cpp
    trajectoryPluginWrapper.cpp
    vizkit-taste.cpp
    waypointPluginWrapper.cpp
    )
    
set(HEADERS
    BodyStatePluginController.hpp
    ConfigurationReader.hpp
    DepthMapPluginController.hpp
    GridPluginController.hpp
    LaserScanPluginController.hpp
    ModelPluginController.hpp
    MotionCommandPluginController.hpp
    PluginController.hpp
    PointcloudPluginController.hpp
    RigidBodyStatePluginController.hpp
    SonarBeamPluginController.hpp
    TextureBoxPluginController.hpp
    TrajectoryPluginController.hpp
    VizkitInstance.hpp
    WaypointPluginController.hpp
    bodyStatePluginWrapper.h
    depthMapPluginWrapper.h
    laserScanPluginWrapper.h
    motionCommandPluginWrapper.h
    pointcloudPluginWrapper.h
    rigidBodyStatePluginWrapper.h
    sonarBeamPluginWrapper.h
    trajectoryPluginWrapper.h
    vizkit-taste.h
    waypointPluginWrapper.h
    wrapperTemplate.hpp
    )
    
    
sargon_library(vizkit-taste 
    SOURCES ${SOURCES}
    HEADERS ${HEADERS}
    DEPS_PKGCONFIG vizkit3d vizkit3d-viz base base-viz asn1-types asn1-wrappers yaml-cpp
    LIBS ${Boost_THREAD_LIBRARY} ${Boost_SYSTEM_LIBRARY})

