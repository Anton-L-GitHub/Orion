resource "openstack_compute_instance_v2" "nextcloud" {
  for_each    = var.nextcloud
  name        = each.key
  image_name  = var.nextcloud_config["image"]
  flavor_name = var.nextcloud_config["flavor"]
  key_pair    = openstack_compute_keypair_v2.user_key.name
  user_data   = file("scripts/nextcloud_config.sh")
  network {
    port = openstack_networking_port_v2.nextcloud_ports[each.key].id
  }
}

resource "openstack_networking_port_v2" "nextcloud_ports" {
  for_each       = var.nextcloud
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
