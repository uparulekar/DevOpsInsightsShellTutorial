#!/bin/bash

# 
# Environment variables
#

# This is the name of the application that shows up on the Dashboard
export LOGICAL_APP_NAME="Weather Application"

# This value is prefixed to the build number
export BUILD_PREFIX=master

# The id of the toolchain that shows up on the brower URL
export TOOLCHAIN_ID="<Enter toolchain id here>"

# A unique number identifying the build
export BUILD_NUMBER=1

# API Key of the user
export IBM_CLOUD_API_KEY="<API key here>"

# Set the value to true to see detail CLI logs
#export IDRA_DEBUG=false


#
# Upload a build record for this build, It is assumed that the build was successful
idra --publishbuildrecord  --branch=master --repositoryurl=https://test-iam-1 --commitid=12344234 --status=pass

#
# Upload unittest test record for the build
idra --publishtestresult --filelocation=mocha_pass.json --type=unittest

#
# Upload CodeCoverge test record for the build
idra --publishtestresult --filelocation=istanbul_pass.json --type=code

#
# Invoke a DevOps Insights gate to evaluated a policy based on uploaded data
idra --evaluategate  --policy=FirstPolicy

#
# Upload a deployment record, It is assumed that the deployment was successful
idra --publishdeployrecord  --env=dev --status=pass
