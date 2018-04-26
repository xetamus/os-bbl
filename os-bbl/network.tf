resource "openstack_networking_network_v2" "bbl-network" {
  name = "${var.env_id}-bbl-network"
  region = "${var.region}"
}

resource "openstack_networking_subnet_v2" "bbl-subnet" {
  name = "${var.env_id}-bbl-subnet"
  region = "${var.region}"
  network_id = "${openstack_networking_network_v2.bbl-network.id}"
  cidr = "${var.internal_cidr}"
  gateway_ip = "${var.internal_gw}"
  #dns_nameservers = ["${var.dns}"]
}

resource "openstack_networking_router_v2" "bbl-router" {
  name = "${var.env_id}-bbl-router"
  region = "${var.region}"
  external_network_id = "${var.external_network_uuid}"
}

resource "openstack_networking_router_interface_v2" "bbl-router-interface" {
  region = "${var.region}"
  router_id = "${openstack_networking_router_v2.bbl-router.id}"
  subnet_id = "${openstack_networking_subnet_v2.bbl-subnet.id}"
}

resource "openstack_compute_floatingip_v2" "jumpbox" {
  pool = "${var.external_network}"
}

output "jumpbox-ip" {
  value="BBL_OPENSTACK_EXTERNAL_IP=${openstack_compute_floatingip_v2.jumpbox.address}"
}

output "bbl-network" {
  value = "BBL_OPENSTACK_NETWORK_ID=${openstack_networking_network_v2.bbl-network.id}"
}
