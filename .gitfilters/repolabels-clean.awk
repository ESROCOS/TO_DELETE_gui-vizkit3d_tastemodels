#!/usr/bin/gawk -f
# ======================================================================
#  FILE:  repolabels-clean.awk
# ======================================================================
#  PROJECT:             :  SARGON
#  VERSION              :  0.1
#  LANGUAGE             :  AWK
#  AUTHOR               :  Miguel Munoz
#  COPYRIGHT            :  AVOS - GMV,S.A.
#  COMPILER             :  -
#  CREATED              :  27/04/2016
#  CLASS                :  -
#  LAST MODIFIED        :  12/05/2016
#  GENERATED FROM MODEL :  -
#  ORIGINAL MODEL AUTHOR:  -
#
# ..................................................................
#  Script to clean header label substitutions (dates, author, etc.)
#  on the files in the Git repository.
#  Configure the filter with:
#  git config --global filter.repolabels.clean"repolabels-clean.awk"
# ..................................................................
#  HISTORY
#  12/05/2016      1.0        mgma        First upload, converted to GAWK.
#
# ======================================================================


BEGIN {
}

/\$.*\[URL\]\$/ {
    gsub(/\$.*\[URL\]\$/, "$URL$", $0)
}

/\$.*\[Revision\]\$/ {
    gsub(/\$.*\[Revision\]\$/, "$Revision$", $0)
}

/\$.*\[CreationDate\]\$/ {
    gsub(/\$.*\[CreationDate\]\$/, "$CreationDate$", $0)
}

/\$.*\[LastChangedDate\]\$/ {
    gsub(/\$.*\[LastChangedDate\]\$/, "$LastChangedDate$", $0)
}

/\$.*\[CreatedBy\]\$/ {
    gsub(/\$.*\[CreatedBy\]\$/, "$CreatedBy$", $0)
}

/\$.*\[LastChangedBy\]\$/ {
    gsub(/\$.*\[LastChangedBy\]\$/, "$LastChangedBy$", $0)
}

/\$.*\[History\]\$/ {
    next
}

//

END {
}
