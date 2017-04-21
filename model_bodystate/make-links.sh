#!/bin/sh

# Makes symbolic links to the configuration and data files of the 
# tests so that they can be launched from the TASTE test folder.

ln -fs ../config/config-bodystate.yml config-bodystate.yml
ln -fs ../config/stim300.stl stim300.stl
