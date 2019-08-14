#!/bin/bash

#TODO CHECK VARS BEFORE RUNNING COMMANDS

###########
# TWITTER #
###########
# User must have twurl and be authorized
# Get Twitter followers, put them in a file called twitter.json
twurl /1.1/followers/ids.json?screen_name=${TWITTER_HANDLE} >> twitter.json

########
# PYPI #
########

# Get PyPI info and put it in a file called pypi.json
curl "https://pypi.org/pypi/${PYPI_PACKAGE}/json" >> pypi.json

################
# LIBRARIES.IO #
################
#TODO: Figure out good DevX for putting in API key. RN needs to be set in command line
#TODO: Add your API key here OR run a script to set your env vars
#LIB_IO_API_KEY="your-key-here"
#TODO: Add a check for variable
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
curl "https://api.github.com/repos/${GITHUB_ORG_COMPARE}/${GITHUB_REPO_COMPARE}" >> github-repo-info-${GITHUB_REPO_COMPARE}.json

# Get top 100 contributors and store in file
curl "https://api.github.com/repos/${GITHUB_ORG}/${GITHUB_REPO}/stats/contributors" >> github-contributors-${GITHUB_REPO}.json



