data "ibm_is_ssh_key" "ssh_key" {
  name = var.ssh_public_key
}

resource "ibm_is_instance" "openvpn_instance" {
  name    = var.instance_name
  vpc     = var.create_vpc ? ibm_is_vpc.vpc[0].id : data.ibm_is_vpc.existing_vpc[0].id
  profile = var.instance_profile
  zone    = var.zone_region
  image   = data.ibm_is_image.linux_image.id

  primary_network_interface {
    subnet          = ibm_is_subnet.subnet.id
    security_groups = [ibm_is_security_group.sg.id]
  }

  user_data = templatefile("${path.root}/scripts/cloud-config.yaml", {
    install_script_base64 = base64encode(file("${path.root}/scripts/install.sh"))
  })
  keys = [data.ibm_is_ssh_key.ssh_key.id]
}
resource "ibm_is_floating_ip" "openvpn" {
  name   = "openvpn-floating-ip"
  target = ibm_is_instance.openvpn_instance.primary_network_interface[0].id
}

resource "ibm_is_dns_zone" "dns_zone" {
  name        = var.dns_zone_name
  label       = "openvpn-zone"
  description = "DNS zone for OpenVPN server"
}

resource "ibm_is_dns_record" "openvpn_dns_record" {
  zone       = ibm_is_dns_zone.dns_zone.id
  name       = var.dns_entry_name
  type       = "A"
  ttl        = 300 
  addresses  = [ibm_is_floating_ip.openvpn.address]
}
