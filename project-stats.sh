#!/bin/bash

#CHECK VARS BEFORE RUNNING COMMANDS

if [ -z ${TWITTER_HANDLE} ]; then
  echo "Must set \$TWITTER_HANDLE. Please set it and retry. For example: TWITTER_HANDLE=TwitterDev"
  exit 1
fi

if [ -z ${PYPI_PACKAGE} ]; then
  echo "Must set \$PYPI_PACKAGE. Please set it and retry. For example: PYPI_PACKAGE=apache-airflow"
  exit 1
fi

if [ -z ${LIB_IO_API_KEY} ]; then
  echo "Must set \$LIB_IO_API_KEY. Please set it and retry. For example LIB_IO_API_KEY=my-api-key. For info on how to obtain your API key, refer to https://libraries.io/api"
  exit 1
fi

if [ -z ${GITHUB_REPO} ] || [ -z ${GITHUB_ORG} ]; then
  echo "Must set \$GITHUB_REPO and \$GITHUB_ORG. Please set them and retry. For example, GITHUB_REPO=airflow, GITHUB_ORG=apache."
  exit 1
fi

# GET time in epoch format
CURRENT_DATE=`date +%Y-%m-%d`
CURRENT_EPOCH_TIME=`date +%s`

# if there isn't an output directory for the current date, make it
if [ ! -d ${CURRENT_DATE} ]; then
  mkdir ${CURRENT_DATE}
fi
# change into that directory, make subdirectory, change into it
cd ${CURRENT_DATE}
mkdir ${CURRENT_EPOCH_TIME}
cd ${CURRENT_EPOCH_TIME}

if [ -z ${GITHUB_REPO_COMPARE} ] || [ -z ${GITHUB_ORG_COMPARE} ]; then
  # assume the user doesn't want to compare repos, don't quit program, just continue.
  echo "If you'd like to gather stats for a comparison repo, set \$GITHUB_REPO_COMPARE and \$GITHUB_ORG_COMPARE then retry."
else
  curl "https://api.github.com/repos/${GITHUB_ORG_COMPARE}/${GITHUB_REPO_COMPARE}" >> github-repo-info-${GITHUB_REPO_COMPARE}.json
fi


###########
# TWITTER #
###########
# User must have twurl and be authorized
# Get Twitter followers, put them in a file called twitter.json
twurl /1.1/followers/ids.json?screen_name=${TWITTER_HANDLE} >> twitter.json

# PYPI #
########
# Get PyPI info and put it in a file called pypi.json
curl "https://pypi.org/pypi/${PYPI_PACKAGE}/json" >> pypi.json

################
# LIBRARIES.IO #
################
# Get Libraries IO package dependents, put in file libraries-io-dependents.json
curl "https://libraries.io/api/pypi/${PYPI_PACKAGE}/dependents?api_key=${LIB_IO_API_KEY}" >> libraries-io-dependents.json
# Get Libraries IO usage, put in file libraries-io-usage.json
curl "https://libraries.io/api/pypi/${PYPI_PACKAGE}/usage?api_key=${LIB_IO_API_KEY}" >> libraries-io-usage.json
#Get repos dependent on apache-airflow
curl "https://libraries.io/api/pypi/${PYPI_PACKAGE}/dependent_repositories?api_key=${LIB_IO_API_KEY}" >> libraries-io-dependent-repos.json

##########
# GITHUB #
##########

# Get a bunch of info about the repos - store it in file
curl "https://api.github.com/repos/${GITHUB_ORG}/${GITHUB_REPO}" >> github-repo-info-${GITHUB_REPO}.json

# Get top 100 contributors and store in file
curl "https://api.github.com/repos/${GITHUB_ORG}/${GITHUB_REPO}/stats/contributors" >> github-contributors-${GITHUB_REPO}.json


