resource "openstack_compute_instance_v2" "databases" {
  for_each    = var.databases
  name        = each.key
  image_name  = var.databases_config["image"]
  flavor_name = var.databases_config["flavor"]
  key_pair    = openstack_compute_keypair_v2.user_key.name
  user_data   = file("scripts/databases_config.sh")
  network {
    port = openstack_networking_port_v2.databases_ports[each.key].id
  }

}

resource "openstack_networking_port_v2" "databases_ports" {
  for_each       = var.databases
  name           = "port-${each.key}"
  network_id     = openstack_networking_network_v2.internal-net-01.id
  admin_state_up = true
  security_group_ids = [
    openstack_compute_secgroup_v2.DB.id
  ]
  fixed_ip {
    subnet_id = openstack_networking_subnet_v2.internal-sub-01.id
  }
}


# #### VOLUME MANAGEMENT ####

# # Create volume
# resource "openstack_blockstorage_volume_v2" "databases_volumes" {
#   for_each = var.databases
#   name     = "db-${each.key}"
#   size     = var.databases_config["volume_size"]
# }

# # Attach volume to instance instance db
# resource "openstack_compute_volume_attach_v2" "databases_volumes" {
#   for_each    = var.databases
#   instance_id = openstack_compute_instance_v2.databases[each.key].id
#   volume_id   = openstack_compute_instance_v2.databases[each.key].id
# }
