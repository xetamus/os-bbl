#!/bin/bash

source ./os-bbl-vars.sh

bbl plan

terraform init os-bbl
terraform plan -var-file=${BBL_VARS_FILE} -state=${OS_BBL_STATEFILE} os-bbl
terraform apply -var-file=${BBL_VARS_FILE} -state=${OS_BBL_STATEFILE} os-bbl

export $(terraform output -state=${OS_BBL_STATEFILE} jumpbox-ip)
export $(terraform output -state=${OS_BBL_STATEFILE} bbl-network)
export $(terraform output -state=${OS_BBL_STATEFILE} bbl-secgroup)
export $(terraform output -state=${OS_BBL_STATEFILE} bbl-keypair)

echo "$(terraform output -state=${OS_BBL_STATEFILE} bbl-private-key)" > bbl_private_key
export BBL_OPENSTACK_PRIVATE_KEY="$(cat bbl_private_key)"

bbl plan
bbl up
