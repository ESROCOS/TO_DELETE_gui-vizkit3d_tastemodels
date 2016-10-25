#!/bin/sh

# Makes symbolic links to the configuration and data files of the 
# tests so that they can be launched from the TASTE test folder.

ln -fs ../../test/config-range.yml config-range.yml
ln -fs ../../test/sonar_beam.data sonar_beam.data
ln -fs ../../test/sargon.png sargon.png
