export BBL_IAAS=openstack
export BBL_OPENSTACK_AUTH_URL=${OS_AUTH_URL}
export BBL_OPENSTACK_PASSWORD="${OS_PASSWORD}"
export BBL_OPENSTACK_USERNAME=${OS_USERNAME}
export BBL_OPENSTACK_PROJECT=${OS_PROJECT_NAME}
export BBL_OPENSTACK_DOMAIN=${OS_USER_DOMAIN_NAME}
export BBL_OPENSTACK_REGION=${OS_REGION_NAME}
export OS_BBL_STATEFILE="os-bbl/os-bbl.tfstate"
export BBL_VARS_FILE="vars/bbl.tfvars"

# SET THESE
export BBL_OPENSTACK_INTERNAL_CIDR=
export BBL_OPENSTACK_AZ=
export TF_VAR_external_network=
export TF_VAR_external_network_uuid=
export TF_VAR_dns=
