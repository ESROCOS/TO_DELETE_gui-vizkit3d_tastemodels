#!/usr/bin/gawk -f
# ======================================================================
#  FILE:  repolabels-smudge.awk
# ======================================================================
#  PROJECT:             :  SARGON
#  VERSION              :  0.1
#  LANGUAGE             :  AWK
#  AUTHOR               :  Miguel Munoz
#  COPYRIGHT            :  AVOS - GMV,S.A.
#  COMPILER             :  -
#  CREATED              :  27/04-2016
#  CLASS                :  -
#  LAST MODIFIED        :  12/05/2016
#  GENERATED FROM MODEL :  -
#  ORIGINAL MODEL AUTHOR:  -
#
# ..................................................................
#  Script to perform header label substitutions (dates, author, etc.)
#  on the files in the Git repository.
#  Configure the filter with:
#  git config --global filter.repolabels.smudge "repolabels-smudge.awk -v URL=%f"
# ..................................................................
#  HISTORY
#  12/05/2016      1.0        mgma        First version, converted to GAWK.
#
# ======================================================================


BEGIN {
}

/\$URL\$/ {
    gsub(/\$URL\$/, "$ " URL " [URL]$", $0)
}

/\$Revision\$/ {
    cmd = "git log --pretty=format:\"%h\" -1"
    cmd | getline HASH
    gsub(/\$Revision\$/, "$ " HASH " [Revision]$", $0)
}

/\$CreationDate\$/ {
    cmd = "git log --pretty=format:\"%cd\" --reverse -- " URL " | head -1"
    cmd | getline date
    gsub(/\$CreationDate\$/, "$ " date " [CreationDate]$", $0)
}

/\$LastChangedDate\$/ {
    cmd = "git log --pretty=format:\"%cd\" -1 -- " URL
    cmd | getline date
    gsub(/\$LastChangedDate\$/, "$ " date " [LastChangedDate]$", $0)
}

/\$CreatedBy\$/ {
    cmd = "git log --pretty=format:\"%an\" -1 -- " URL    
    cmd | getline name
    gsub(/\$CreatedBy\$/, "$ " name " [CreatedBy]$", $0)
}

/\$LastChangedBy\$/ {
    cmd = "git log --pretty=format:\"%cn\" -1 -- " URL
    cmd | getline name
    gsub(/\$LastChangedBy\$/, "$ " name " [LastChangedBy]$", $0)
}

/\$History\$/ {
    cmd = "git log --pretty=format:\"%h %ci %cn%x09%s\" --reverse -- " URL
    
    prefix = $0
    gsub(/\$History\$/, "", prefix)
    
    while ((cmd | getline line) > 0) {
        print prefix "$ " line " [History]$"
    }
    
    print prefix "$History$"
    next
}

//

END {
}
