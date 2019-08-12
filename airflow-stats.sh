#!/bin/bash

###########
# TWITTER #
###########
# User must have twurl and be authorized
# Get Twitter followers, put them in a file called twitter.json
twurl /1.1/followers/ids.json?screen_name=ApacheAirflow >> twitter.json

########
# PYPI #
########

# Get PyPI info and put it in a file called pypi.json
curl "https://pypi.org/pypi/apache-airflow/json" >> pypi.json

################
# LIBRARIES.IO #
################
#TODO: Figure out good DevX for putting in API key. RN needs to be set in command line
#TODO: Add your API key here OR run a script to set your env vars
#LIB_IO_API_KEY="your-key-here"
#TODO: Add a check for variable
# Get Libraries IO package dependents, put in file libraries-io-dependents.json
curl "https://libraries.io/api/pypi/apache-airflow/dependents?api_key=${LIB_IO_API_KEY}" >> libraries-io-dependents.json
# Get Libraries IO usage, put in file libraries-io-usage.json
curl "https://libraries.io/api/pypi/apache-airflow/usage?api_key=${LIB_IO_API_KEY}" >> libraries-io-usage.json
#Get repos dependent on apache-airflow
curl "https://libraries.io/api/pypi/apache-airflow/dependent_repositories?api_key=${LIB_IO_API_KEY}" >> libraries-io-dependent-repos.json
##########
# GITHUB #
##########

# Get a bunch of info about the repos - store it in file
curl "https://api.github.com/repos/apache/airflow" >> github-repo-info-airflow.json
curl "https://api.github.com/repos/spotify/luigi" >> github-repo-info-luigi.json

# Get top 100 contributors and store in file
curl "https://api.github.com/repos/apache/airflow/stats/contributors" >> github-contributors-airflow.json



