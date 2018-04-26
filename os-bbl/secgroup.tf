resource "openstack_networking_secgroup_v2" "bbl-secgroup" {
  name = "${var.env_id}-bbl"
  description = "bbl security group"
  region = "${var.region}"
}

resource "openstack_networking_secgroup_rule_v2" "bbl-ssh" {
  security_group_id = "${openstack_networking_secgroup_v2.bbl-secgroup.id}"
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "tcp"
  port_range_min = 22
  port_range_max = 22
  remote_ip_prefix = "0.0.0.0/0"
}

resource "openstack_networking_secgroup_rule_v2" "bbl-agent" {
  security_group_id = "${openstack_networking_secgroup_v2.bbl-secgroup.id}"
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "tcp"
  port_range_min = 6868
  port_range_max = 6868
  remote_ip_prefix = "0.0.0.0/0"
}

resource "openstack_networking_secgroup_rule_v2" "bbl-director" {
  security_group_id = "${openstack_networking_secgroup_v2.bbl-secgroup.id}"
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "tcp"
  port_range_min = 25555
  port_range_max = 25555
  remote_ip_prefix = "0.0.0.0/0"
}

resource "openstack_networking_secgroup_rule_v2" "bbl-internal" {
  security_group_id = "${openstack_networking_secgroup_v2.bbl-secgroup.id}"
  remote_group_id = "${openstack_networking_secgroup_v2.bbl-secgroup.id}"
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "tcp"
  port_range_min = 1
  port_range_max = 65535
}

resource "openstack_networking_secgroup_rule_v2" "bbl-icmp" {
  security_group_id = "${openstack_networking_secgroup_v2.bbl-secgroup.id}"
  remote_group_id = "${openstack_networking_secgroup_v2.bbl-secgroup.id}"
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "icmp"
}

resource "openstack_networking_secgroup_rule_v2" "bbl-http" {
  security_group_id = "${openstack_networking_secgroup_v2.bbl-secgroup.id}"
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "tcp"
  port_range_min = 80
  port_range_max = 80
  remote_ip_prefix = "0.0.0.0/0"
}

resource "openstack_networking_secgroup_rule_v2" "bbl-https" {
  security_group_id = "${openstack_networking_secgroup_v2.bbl-secgroup.id}"
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "tcp"
  port_range_min = 443
  port_range_max = 443
  remote_ip_prefix = "0.0.0.0/0"
}

resource "openstack_networking_secgroup_rule_v2" "concourse-web" {
  security_group_id = "${openstack_networking_secgroup_v2.bbl-secgroup.id}"
  direction = "ingress"
  ethertype = "IPv4"
  protocol = "tcp"
  port_range_min = 8080
  port_range_max = 8080
  remote_ip_prefix = "0.0.0.0/0"
}

output "bbl-secgroup" {
  value = "BBL_OPENSTACK_DEFAULT_SECURITY_GROUP=${openstack_networking_secgroup_v2.bbl-secgroup.name}"
}
