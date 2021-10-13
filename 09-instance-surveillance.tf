resource "openstack_compute_instance_v2" "surveillance" {
  for_each    = var.surveillance
  name        = each.key
  image_name  = var.surveillance_config["image"]
  flavor_name = var.surveillance_config["flavor"]
  key_pair    = openstack_compute_keypair_v2.user_key.name
  user_data   = file("scripts/surveillance_config.sh")
  network {
    port = openstack_networking_port_v2.surveillance_ports[each.key].id
  }
}

resource "openstack_networking_port_v2" "surveillance_ports" {
  for_each       = var.surveillance
  name           = "port-${each.key}"
  network_id     = openstack_networking_network_v2.external-net-01.id
  admin_state_up = true
  security_group_ids = [
    openstack_compute_secgroup_v2.surveillanceSG.id
  ]
  fixed_ip {
    subnet_id = openstack_networking_subnet_v2.external-sub-01.id
  }
}

