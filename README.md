# Setup

Set the following environment variables to the appropriate values

* `TWITTER_HANDLE` - the Twitter handle of the account you want to follow
* `LIB_IO_API_KEY` - your libraries.io API key
* `PYPI_PACKAGE` - the PyPI package you'd like info about
* `GITHUB_ORG` - the GitHub organization of the repo you are exploring
* `GITHUB_REPO` - the GitHub repo you are exploring

Optional environment variables

* `GITHUB_ORG_COMPARE` - the name of a second GitHub org you're using when comparing stats
* `GITHUB_REPO_COMPARE` - the name of a second GitHub repo (in the GITHUB_ORG_COMPARE org)

# Usage

The when the `project-stats.sh` script is run, the results are saved in JSON files - one for each curl command in the script. Once your environment variables are set, change to the directory where you'd like your output to be saved and run the following command:

`bash project-stats.sh`


When the command has finshed running, you can explore your data manually. 

TODO: Instructions for Python script. 

