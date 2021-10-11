# Router
resource "openstack_networking_router_v2" "router-1" {
  name                = var.router["name"]
  external_network_id = var.router["external_gateway_UUID"]
  admin_state_up      = true
}

# Networks
resource "openstack_networking_network_v2" "users-net-01" {
  name           = var.user_network["name"]
  admin_state_up = "true"
}

resource "openstack_networking_network_v2" "external-net-01" {
  name           = var.external_network["name"]
  admin_state_up = "true"
}

resource "openstack_networking_network_v2" "internal-net-01" {
  name           = var.internal_network["name"]
  admin_state_up = "true"
}


# Subnets
resource "openstack_networking_subnet_v2" "users-sub-01" {
  network_id      = openstack_networking_network_v2.users-net-01.id
  name            = var.user_network["sub_01_name"]
  cidr            = var.user_network["sub_01_cidr"]
  dns_nameservers = var.dns_external
  ip_version      = 4
}

resource "openstack_networking_subnet_v2" "external-sub-01" {
  network_id      = openstack_networking_network_v2.external-net-01.id
  name            = var.external_network["sub_01_name"]
  cidr            = var.external_network["sub_01_cidr"]
  dns_nameservers = var.dns_external
  ip_version      = 4
}

resource "openstack_networking_subnet_v2" "internal-sub-01" {
  network_id = openstack_networking_network_v2.internal-net-01.id
  name       = var.internal_network["sub_01_name"]
  cidr       = var.internal_network["sub_01_cidr"]
  ip_version = 4
}

# Connect subnets to router
resource "openstack_networking_router_interface_v2" "router-interface-1" {
  router_id = openstack_networking_router_v2.router-1.id
  subnet_id = openstack_networking_subnet_v2.internal-sub-01.id
}

resource "openstack_networking_router_interface_v2" "router-interface-2" {
  router_id = openstack_networking_router_v2.router-1.id
  subnet_id = openstack_networking_subnet_v2.external-sub-01.id
}

resource "openstack_networking_router_interface_v2" "router-interface-3" {
  router_id = openstack_networking_router_v2.router-1.id
  subnet_id = openstack_networking_subnet_v2.users-sub-01.id
}

# Allocate floating ip
resource "openstack_compute_floatingip_v2" "floatip_1" {
  pool = var.router["float_ip"]
}

