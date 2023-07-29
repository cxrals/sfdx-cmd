# 1. Create DE org where you'll define the namespace
# 2. Create DE org and enable DevHub
# 3. Login to the DevHub org -> Go to the App Launcher -> Select Namespace Registries
# 4. Click on the "Link Namespace" button to link your namespace org

# Creating a 2GP pack
sf package create --name myPckgName --description "My Package" --package-type Managed --path force-app --target-dev-hub devHubOrg

: '
    {
        "packageDirectories": [
          {
             "path": "force-app",
             "default": true,
             "package": "myPckgName",
             "versionName": "ver 0.1",
             "versionNumber": "0.1.0.NEXT"
          }
        ],
        "namespace": "",
        "sfdcLoginUrl": "https://login.salesforce.com",
        "sourceApiVersion": "56.0",
        "packageAliases": {
          "myPckgName": "0Hoxxx"
        }
    }
'

# List all the packages associated with your DevHub 
sf package list

# Create the Package Version
# 1. In sfdx-project.json change the versionName to Version 1.0
# 2. In sfdx-project.json change the versionNumber to 1.0.0.NEXT
# 3. In the force-app directory, create the package version

# Create the Package Version
sf package version create -p myPckgName -d force-app -k test1234 --wait 10 --target-dev-hub devHubOrg

# Use the package version alias to install the package version in the scratch org
sf package install --wait 10 --publish-wait 10 --package myPckgName@1.0.0-1 -k test1234 -r --target-org MyScratchOrgAlias

# open scratch org and test it
sf org open -o MyScratchOrgAlias

# Release the Package Version
sf package version promote -p myPckgName@1.0.0-1 -v devHubOrg