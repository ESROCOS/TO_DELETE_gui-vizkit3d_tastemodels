#!/bin/sh

# Makes symbolic links to the configuration and data files of the 
# tests so that they can be launched from the TASTE test folder.

ln -fs ../config/config-range.yml config-range.yml
ln -fs ../config/sonar_beam.data sonar_beam.data
ln -fs ../config/sargon.png sargon.png
