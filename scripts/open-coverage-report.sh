#!/bin/sh

# ======================================================================
#  FILE:  $URL$
# ======================================================================
#  PROJECT:             :  SARGON
#  VERSION              :  $Revision$
#  LANGUAGE             :  Shell script
#  AUTHOR               :  $LastChangedBy$ 
#  COPYRIGHT            :  AVOS - GMV,S.A.
#  COMPILER             :  -
#  CREATED              :  $CreationDate$
#  CLASS                :  -
#  LAST MODIFIED        :  $LastChangedDate$
#  GENERATED FROM MODEL :  -
#  ORIGINAL MODEL AUTHOR:  -
#
# ..................................................................
#  Generate a coverage report with lcov. Run from the build folder.
# ..................................................................
#  HISTORY
#  $History$
#
# ======================================================================

lcov --capture --directory . --output-file coverage.info
genhtml coverage.info --output-directory coverage
xdg-open coverage/index.html    
