
resource "openstack_compute_secgroup_v2" "SSH" {
  name        = "SSH"
  description = "ALLOW SSH"

  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = var.user_network["sub_01_cidr"]
  }
}

resource "openstack_compute_secgroup_v2" "HTTP-HTTPS" {
  name        = "HTTP/HTTPS"
  description = "ALLOW Webtraffic"

  rule {
    from_port   = 80
    to_port     = 80
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }

  rule {
    from_port   = 443
    to_port     = 443
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
}

resource "openstack_compute_secgroup_v2" "DB" {
  name        = "DB"
  description = "ALLOW MySQL"
  rule {
    from_port   = 3306
    to_port     = 3306
    ip_protocol = "tcp"
    cidr        = var.internal_network["sub_01_cidr"]
  }
}

resource "openstack_compute_secgroup_v2" "SMTP" {
  name        = "SMTP"
  description = "ALLOW SMTP on 587 & 2525"

  rule {
    from_port   = 587
    to_port     = 587
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }

  rule {
    from_port   = 2525
    to_port     = 2525
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
}

resource "openstack_compute_secgroup_v2" "HTTP-HTTPS-intranet" {
  name        = "HTTP/HTTPS"
  description = "ALLOW Webtraffic from internal-user-network"

  rule {
    from_port   = 80
    to_port     = 80
    ip_protocol = "tcp"
    cidr        = var.internal_network["sub_01_cidr"]
  }

  rule {
    from_port   = 443
    to_port     = 443
    ip_protocol = "tcp"
    cidr        = var.internal_network["sub_01_cidr"]
  }
}
resource "openstack_compute_secgroup_v2" "surveillance" {
  name        = "Surveillance"
  description = "ALLOW Surveillance camera access"

  rule {
    from_port   = 5000
    to_port     = 5000
    ip_protocol = "tcp"
    cidr        = var.internal_network["sub_01_cidr"]
  }
}
