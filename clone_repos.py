from urllib.request import urlopen
import json
import subprocess
import os

group_name = "uva-robotics"
group_id = 0
token = os.environ['gitlab_api_key']

destination = os.path.abspath("src")

allGroups = urlopen("https://gitlab.com/api/v3/groups?private_token=" + token)
allGroupsDict = json.loads(allGroups.read().decode())

for group in allGroupsDict:
    try:
        if group['full_name'] == group_name:
            group_id = group['id']

    except Exception as e:
        print("Error on %s: %s" % (group, e))

if group_id:
    all_projects = urlopen("https://gitlab.com/api/v3/groups/" + str(group_id) + "/projects?private_token=" + token)
    all_projects_dict = json.loads(all_projects.read().decode())
    for project in all_projects_dict:
        clone_dest = os.path.join(destination, project['name'])
        subprocess.call(['git', 'clone', project['ssh_url_to_repo'], clone_dest])
