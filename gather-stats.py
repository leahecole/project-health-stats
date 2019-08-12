import json

# twitter info
with open('twitter.json', 'r') as read_file:
    data = json.load(read_file)
print('@ApacheAirflow has {} followers on Twitter'.format(len(data['ids'])))

# pypi info
# TODO: improve what info is being printed here
with open('pypi.json', 'r') as read_file:
  data = json.load(read_file)
print('apache-airflow has {} releases on PyPI'.format(len(data['releases'])))

# libraries IO info
# Usage
with open('libraries-io-dependents.json', 'r') as read_file:
  data = json.load(read_file)
print('{} packages are dependent on apache-airflow'.format(len(data)))

#packages dependent
with open('libraries-io-usage.json', 'r') as read_file:
  data = json.load(read_file)
total = 0
for key in data.keys():
  total += data[key]
#print(data) # shows breakdown of usage by version
print('{} OSS projects use apache-airflow'.format(total))

# Repos dependent
# with open('libraries-io-dependent-repos.json', 'r') as read_file:
#  data = json.load(read_file)

# github airflow

# github luigi
