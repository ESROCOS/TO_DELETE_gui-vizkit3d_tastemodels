#!/bin/sh

# Makes symbolic links to the configuration and data files of the 
# tests so that they can be launched from the TASTE test folder.

ln -fs ../config/config-robot.yml config-robot.yml
ln -fs ../config/spacebot_arm spacebot_arm
