data "ibm_is_ssh_key" "ssh_key" {
  name = var.ssh_public_key
}

resource "ibm_is_instance" "openvpn_instance" {
  name    = var.instance_name
  vpc     = ibm_is_vpc.vpc.id
  profile = var.instance_profile
  zone    = var.zone_region
  image   = data.ibm_is_image.linux_image.id
  primary_network_interface {
    subnet          = ibm_is_subnet.subnet.id
    security_groups = [ibm_is_security_group.sg.id]
  }
  keys      = [var.ssh_public_key]
  user_data = file("${path.module}/user_data.conf")
}

data "template_file" "userdata" {
  template = file(var.user_data)
}