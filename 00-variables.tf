###### NETWORKING ########

variable "router" {
  type = map(string)
  default = {
    name                  = "router-1"
    external_gateway_UUID = "600b8501-78cb-4155-9c9f-23dfcba88828"
    float_ip              = "elx-public1"
  }
}

variable "internal_network" {
  type = map(string)
  default = {
    name        = "internal-net-01"
    sub_01_name = "internal-sub-01"
    sub_01_cidr = "10.10.2.0/24"
  }
}

variable "external_network" {
  type = map(string)
  default = {
    name        = "external-net-01"
    sub_01_name = "external-sub-01"
    sub_01_cidr = "10.10.1.0/24"
  }
}

variable "user_network" {
  type = map(string)
  default = {
    name        = "users-net-01"
    sub_01_name = "users-sub-01"
    sub_01_cidr = "10.100.0.0/24"
  }
}

variable "dns_external" {
  type    = list(string)
  default = ["8.8.8.8", "8.8.4.4"]
}


###### INSTANCES ########
variable "webservers" {
  type    = set(string)
  default = ["web-01", "web-02"]
}

variable "webservers_config" {
  type = map(string)
  default = {
    image  = "ubuntu-20.04-server-latest"
    flavor = "v1-standard-1"
  }
}

variable "databases" {
  type    = set(string)
  default = ["db-01", "db-02"]
}

variable "databases_config" {
  type = map(string)
  default = {
    image  = "ubuntu-20.04-server-latest"
    flavor = "v1-standard-1"
    volume_size = 1
  }
}
variable "mailservers" {
  type    = set(string)
  default = ["mail-01"]
}

variable "mailservers_config" {
  type = map(string)
  default = {
    image  = "ubuntu-20.04-server-latest"
    flavor = "v1-standard-1"
  }
}

variable "nextcloud" {
  type    = set(string)
  default = ["nc-01"]
}

variable "nextcloud_config" {
  type = map(string)
  default = {
    image  = "ubuntu-20.04-server-latest"
    flavor = "v1-standard-1"
  }
}

variable "openstack" {
  type    = set(string)
  default = ["openstack-01"]
}

variable "openstack_config" {
  type = map(string)
  default = {
    image  = "ubuntu-20.04-server-latest"
    flavor = "v1-standard-1"
  }
}
variable "surveillance" {
  type    = set(string)
  default = ["surveillance-01"]
}

variable "surveillance_config" {
  type = map(string)
  default = {
    image  = "ubuntu-20.04-server-latest"
    flavor = "v1-standard-1"
  }
}

