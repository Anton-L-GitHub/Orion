resource "openstack_compute_instance_v2" "openstack" {
  for_each    = var.openstack
  name        = each.key
  image_name  = var.openstack_config["image"]
  flavor_name = var.openstack_config["flavor"]
  key_pair    = openstack_compute_keypair_v2.user_key.name
  user_data   = file("scripts/openstack_config.sh")
  network {
    port = openstack_networking_port_v2.openstack_ports[each.key].id
  }
}

resource "openstack_networking_port_v2" "openstack_ports" {
  for_each       = var.openstack
  name           = "port-${each.key}"
  network_id     = openstack_networking_network_v2.internal-net-01.id
  admin_state_up = true
  security_group_ids = [
    openstack_compute_secgroup_v2.HTTP-HTTPS-intranet.id
  ]
  fixed_ip {
    subnet_id = openstack_networking_subnet_v2.internal-sub-01.id
  }
}
