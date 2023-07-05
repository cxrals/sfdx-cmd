# create scratch org
sfdx force:org:create -f config/project-scratch-def.json -d 30 -a MyScratchOrgAlias

# generate password for scratch org
sfdx force:user:password:generate --targetusername <username>

# open created scratch org
sfdx force:org:open -u MyScratchOrgAlias

# deploy metadata
sfdx force:source:push

# assign Knowledge license to User
sfdx force:data:record:update -s User -w "Name='User User'" -v "UserPermissionsKnowledgeUser=true"

# assign Permission Set to user
sfdx force:user:permset:assign -n PermSetName