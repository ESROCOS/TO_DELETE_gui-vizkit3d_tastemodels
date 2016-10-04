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
#  Toplevel CMake build script for the vizkit-taste library
# ----------------------------------------------------------------------
#  HISTORY
#  $History$
# ======================================================================

# CMakeLists.txt has to be located in the project folder and cmake has to be
# executed from 'project/build' with 'cmake ../'.
cmake_minimum_required(VERSION 2.6)

# Check SARGON environment
if (NOT DEFINED ENV{SARGON_CURRENT_ROOT})
    message(FATAL_ERROR "Environment variable SARGON_CURRENT_ROOT not set. Run env.sh.")
endif()

find_package(Sargon)
set(SARGON_USE_CXX11 TRUE)
set(CMAKE_BUILD_TYPE $ENV{CMAKE_BUILD_TYPE})
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
sargon_init(vizkit-taste 0.1)
sargon_find_cmake(Boost REQUIRED COMPONENTS thread system)
sargon_standard_layout()
