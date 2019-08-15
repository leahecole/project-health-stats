import json
import os

# twitter info
with open('twitter.json', 'r') as read_file:
    data = json.load(read_file)
try:
  print('@{} has {} followers on Twitter'.format(os.environ['TWITTER_HANDLE'], len(data['ids'])))
except KeyError:
  print("ERROR reading number of Twitter followers. Double check that the environment variable $TWITTER_HANDLE is set and your twitter.json file is valid\n")

# pypi info
# TODO: improve what info is being printed here
with open('pypi.json', 'r') as read_file:
  data = json.load(read_file)
try:
  print('{} has {} releases on PyPI'.format(os.environ['PYPI_PACKAGE'], len(data['releases'])))
except KeyError:
  print("ERROR reading PyPI download info. Double check that the environment variable $PYPI_PACKAGE is set and your pypi.json file is valid\n")


#TODO better understanding of what's being printed here
# libraries IO info
# Usage
with open('libraries-io-dependents.json', 'r') as read_file:
  data = json.load(read_file)
try:
  print('{} packages are dependent on {}'.format(len(data), os.environ['PYPI_PACKAGE']))
except KeyError:
  print("ERROR reading Libraries.IO info. Double check that the environment variable $PYPI_PACKAGE is set and your libraries-io-dependents.json file is valid\n")

#TODO: Better understanding of what's being printed here
#packages dependent
with open('libraries-io-usage.json', 'r') as read_file:
  data = json.load(read_file)
total = 0
for key in data.keys():
  total += data[key]
#print(data) # shows breakdown of usage by version
try:
  print('{} OSS projects use {}'.format(total, os.environ['PYPI_PACKAGE']))
except KeyError:
  print("ERROR reading Libraries.IO info. Double check that the environment variable $PYPI_PACKAGE is set and your libraries-io-usage.json file is valid\n")

#TODO: better understanding of what's being printed here
# Repos dependent
# with open('libraries-io-dependent-repos.json', 'r') as read_file:
#  data = json.load(read_file)

# github airflow
try:
  with open('github-repo-info-{}.json'.format(os.environ['GITHUB_REPO']), 'r') as read_file:
    data = json.load(read_file)
    print('There are {} watches, {} stars, and {} forks of {}/{} on GitHub'.format(data['subscribers_count'], data['stargazers_count'], data['forks_count'], os.environ['GITHUB_ORG'], os.environ['GITHUB_REPO']))
except KeyError:
  print('ERROR reading GitHub info. Double check that the environment variables $GITHUB_ORG and $GITHUB_REPO are set and that your github-repo-info-${GITHUB_REPO}.json file is valid')
except FileNotFoundError:
  print('ERROR reading GitHub info. Double check that the environment variable \$GITHUB_REPO is set.\n')

#airflow contributors

# github luigi
