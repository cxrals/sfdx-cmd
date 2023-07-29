# create scratch org
sf org create scratch -f config/project-scratch-def.json -y 30 -a MyScratchOrgAlias -v targetDevHub

# generate password for scratch org
sf org generate password -o usernameOrAlias

# open created scratch org
sf org open -o MyScratchOrgAlias

# deploy metadata
sf project deploy start
sf project deploy start -d path/to/apex/classes
sf project deploy start --metadata ApexClass CustomObject
sf project deploy start --metadata ApexClass:MyApexClass
sf project deploy start --manifest path/to/package.xml

# assign Knowledge license to User
sfdx data update record -s User -w "Name='User User'" -v "UserPermissionsKnowledgeUser=true"

# assign Permission Set to user
sf org assign permset -n PermSetName