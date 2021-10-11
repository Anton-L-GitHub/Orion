resource "openstack_compute_instance_v2" "mailservers" {
  for_each    = var.mailservers
  name        = each.key
  image_name  = var.mailservers_config["image"]
  flavor_name = var.mailservers_config["flavor"]
  key_pair    = openstack_compute_keypair_v2.user_key.name
  user_data   = file("scripts/mailservers_config.sh")
  network {
    port = openstack_networking_port_v2.mailservers_ports[each.key].id
  }
}

resource "openstack_networking_port_v2" "mailservers_ports" {
  for_each       = var.mailservers
  name           = "port-${each.key}"
  network_id     = openstack_networking_network_v2.external-net-01.id
  admin_state_up = true
  security_group_ids = [
    openstack_compute_secgroup_v2.SMTP.id
  ]
  fixed_ip {
    subnet_id = openstack_networking_subnet_v2.external-sub-01.id
  }
}

resource "openstack_networking_floatingip_v2" "mailservers_ips" {
  for_each = var.mailservers
  pool     = var.router["float_ip"]
}

# Attach floating ip to instance
resource "openstack_compute_floatingip_associate_v2" "mailservers_ips" {
  for_each    = var.mailservers
  floating_ip = openstack_networking_floatingip_v2.mailservers_ips[each.key].address
  instance_id = openstack_compute_instance_v2.mailservers[each.key].id
}
