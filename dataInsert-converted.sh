# enable audit field creation
sf project deploy start -d settings/

# assign permission to admin
sf org assign permset -n SysAdm

# upload Case test data to scratch org
sf data upsert bulk -f data/Cases.csv -i id -s Case --wait 30

# upload Knowledge test data to scratch org
sf data upsert bulk -f data/Knowledge.csv -i id -s Knowledge__kav --wait 30