#! /bin/bash
###################################################
# Author: NewLight- Or Naishtat
# Date: 26.12.2019
# Version: 0.1
# Purpose: This script will install artifactory on RPM or DEB systems from a ZIP file.
# Objectives:
# 1. Check all pre-conditions are met for Artifactory.
# 2. Check which system the user is using and download+install the correct package apropriately.
# 3. Install Artifactory.
# 4. Run tests to make sure Artifactory is installed 
###################################################

## Variables ##
deco_time=2
deco_line='####################################################'
###############
function user_menu() {
echo $deco_line
echo "Welcome to Artifactory Automatic Installer!"
echo $deco_line
echo "1. Install Artifactory RPM "
echo "2. Install Artifactory DEB "
echo "3. I don't know which version to choose. "

}












user_menu
