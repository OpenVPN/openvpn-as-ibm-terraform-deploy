resource "ibm_is_instance" "openvpn_instance" {
  name              = var.instance_name
  vpc               = ibm_is_vpc.vpc.id
  profile           = var.instance_profile
  zone              = var.region
  image             = data.ibm_is_image.linux_image.id
  primary_network_interface {
    subnet          = ibm_is_subnet.subnet.id
    security_groups = [ibm_is_security_group.sg.id]
  }
  keys              = [var.ssh_key_name]
  user_data         = file("${path.module}/user_data.conf")
}
