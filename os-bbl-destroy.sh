#!/bin/bash 

source ./os-bbl-vars.sh

bbl destroy
terraform init os-bbl
terraform destroy -state=${OS_BBL_STATEFILE}
rm bbl_private_key
