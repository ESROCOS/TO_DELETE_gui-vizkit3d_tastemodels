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
#  Set the Git filters to replace file header labels.
#  Run script at the repository root folder.
# ..................................................................
#  HISTORY
#  $History$
#
# ======================================================================

if [ ! -d "$AUTOPROJ_CURRENT_ROOT/autoproj/gitfilters" ] ; then
    echo "Git filters folder not found at $AUTOPROJ_CURRENT_ROOT/autoproj/gitfilters"
    exit 1
fi

echo "Configuring Git filter 'repolabels'"

git config filter.repolabels.smudge 'repolabels-smudge.awk -v URL=%f'
git config filter.repolabels.clean 'repolabels-clean.awk'

