#!/bin/sh

# Makes symbolic links to the configuration and data files of the 
# tests so that they can be launched from the TASTE test folder.

ln -s ../../vizkit-taste-lib/test/config-range.yml config-range.yml
ln -s ../../vizkit-taste-lib/test/sonar_beam.data sonar_beam.data
ln -s ../../vizkit-taste-lib/test/sargon.png sargon.png
