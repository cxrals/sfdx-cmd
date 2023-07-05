# Authorize an org
sfdx force:auth:web:login --instanceurl https://login.salesforce.com --setdefaultusername --setdefaultdevhubusername --setalias vscodeOrg

# Retrieve code inside a package
sfdx force:mdapi:retrieve -s -r ./mdapipkg -u <userName> -p "<packageName>"

# delete scratch org
sfdx force:org:delete -u MyScratchOrgAlias

# list orgs
sfdx force:org:list