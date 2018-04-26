resource "openstack_compute_keypair_v2" "bbl" {
  name = "${var.env_id}-keypair"
}

output "bbl-keypair" {
  value = "BBL_OPENSTACK_DEFAULT_KEY_NAME=${openstack_compute_keypair_v2.bbl.name}"
}

output "bbl-private-key" {
    value = "${openstack_compute_keypair_v2.bbl.private_key}"
}
