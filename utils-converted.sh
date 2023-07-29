# Authorize an org
sf org login web --instance-url https://login.salesforce.com --set-default --set-default-dev-hub --alias orgAlias

# Retrieve code inside a package
sf project retrieve start --source-dir -r ./mdapipkg --target-org userNameOrAlias --package-name "Name of Pkg"

# delete scratch org
sf org delete scratch -o MyScratchOrgAlias

# list orgs
sf org list
sf org list --all