The repolabels filter performs label substitution when committing and 
checking out from the Git repository. This can be used to insert 
fields such as $LastChangedBy$... in the file 
header comments.

To enable the filters:

0. Install GNU Awk (sudo apt-get install gawk)

1. Add the directory containing the filters to the PATH

2. Set the filter for the desired file types in the .gitattributes file:
e.g.
*.py filter=repolabels
Taste2Rock/templates/* filter=repolabels

3. Add the following lines to the .git/config file:

[filter "repolabels"]
        smudge = repolabels-smudge.awk -v URL=%f
        clean = repolabels-clean.awk

