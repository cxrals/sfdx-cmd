# enable audit field creation
sfdx force:source:deploy -p settings/

# assign permission to admin
sfdx force:user:permset:assign -n SysAdm

# upload Case test data to scratch org
sfdx force:data:bulk:upsert -f data/Cases.csv -i id -s Case --wait 30

# upload Knowledge test data to scratch org
sfdx force:data:bulk:upsert -f data/Knowledge.csv -i id -s Knowledge__kav --wait 30