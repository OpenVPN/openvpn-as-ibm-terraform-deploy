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

resource "ibm_dns_domain" "dns_domain" {
  count = var.dns_create ? 1 : 0

  name = var.dns_domain_name
}

resource "ibm_dns_record" "openvpn_dns_record" {
  count = var.dns_create ? 1 : 0

  data               = ibm_is_floating_ip.openvpn.address
  domain_id          = ibm_dns_domain.dns_domain[0].id
  host               = var.dns_entry_name
  responsible_person = var.responsible_person
  ttl                = 900
  type               = "a"
}

