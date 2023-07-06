# 1. Create DE org where you'll define the namespace
# 2. Create DE org and enable DevHub
# 3. Login to the DevHub org -> Go to the App Launcher -> Select Namespace Registries
# 4. Click on the "Link Namespace" button to link your namespace org

# Creating a 2GP pack
sfdx force:package:create --name myPckgName --description "My Package" --packagetype Managed --path force-app --targetdevhubusername devHubOrg

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
sfdx force:package:list

# Create the Package Version
# 1. In sfdx-project.json change the versionName to Version 1.0
# 2. In sfdx-project.json change the versionNumber to 1.0.0.NEXT
# 3. In the force-app directory, create the package version

# Create the Package Version
sfdx force:package:version:create -p myPckgName -d force-app -k test1234 --wait 10 -v devHubOrg

# Use the package version alias to install the package version in the scratch org
sfdx force:package:install --wait 10 --publishwait 10 --package myPckgName@1.0.0-1 -k test1234 -r -u MyScratchOrgAlias

# open scratch org and test it
sfdx force:org:open -u MyScratchOrgAlias

# Release the Package Version
sfdx force:package:version:promote -p myPckgName@1.0.0-1 -v devHubOrg