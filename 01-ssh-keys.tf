resource "openstack_compute_keypair_v2" "user_key" {
  name       = "anton-ssh-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCzMZzVCn6wJ4zjomKjxV0UFoHWduA3JMminmLEllRll3SPsYh1bKodG+GgGOlyxLuiidYVHK43kmdpR/fpR0IsQ93M+73QP9WMiI8ftPWoIEVu7XXHtKtf6zltzZOQV0EVzBWmIA2j5luOUQfe/Us5CJd92TO0kZlKZ/Ok1pKGARtU2rY40LqBbezpOdqdngsU6qlVD4tNlBwssuPdcMmPUEVbIEgxgFaUmwh9TaJkdtAbarOntyYMTPv4oUYU9B95+zEfYBHXCL1ZSIY1p0T/7YNTmSTE7cPnJmqAdg6eOhaGN3sbPHx6sqz0cGsNWoLW4Ynr0znzZFUnQtVbbdmkgyYomr7qRA1v2wP3mLGWFVRpI0S5yriFMlbTEcJDiHxqKwfyc4nNUw9A+h9c+tGWfsRdSEimoVumCDMm21KoCAZGhHtezhSiYefmb6zQeP9y5sSEvNTY5irG2PE6tbq4dcci9/GIsB4/qJeXd6XTmYy3/Xvf5wWxSN0WXD4T5kM= op_key"
}
