data "ibm_is_ssh_key" "ssh_key" {
  name = var.ssh_public_key
}

data "ibm_is_image" "linux_image" {
  name = var.image_name
}

resource "ibm_is_instance" "openvpn_instance" {
  name    = "${var.prefix}-server"
  vpc     = var.vpc_existing_name != "" ? data.ibm_is_vpc.existing_vpc[0].id : ibm_is_vpc.vpc[0].id
  profile = var.instance_profile
  zone    = var.region_zone
  image   = data.ibm_is_image.linux_image.id

  primary_network_interface {
    subnet          = ibm_is_subnet.subnet.id
    security_groups = [ibm_is_security_group.sg.id]
  }

  user_data = templatefile("${path.root}/scripts/cloud-config.yaml", {})

  keys = [data.ibm_is_ssh_key.ssh_key.id]
}

resource "ibm_is_floating_ip" "floating_ip" {
  name   = "${var.prefix}-floating-ip"
  target = ibm_is_instance.openvpn_instance.primary_network_interface[0].id
}

resource "ibm_dns_domain" "dns_domain" {
  count = var.dns_domain_name != "" ? 1 : 0

  name = var.dns_domain_name
}

resource "ibm_dns_record" "openvpn_dns_record" {
  count = var.dns_domain_name != "" && var.dns_entry_name != "" ? 1 : 0

  data               = ibm_is_floating_ip.floating_ip.address
  domain_id          = ibm_dns_domain.dns_domain[0].id
  host               = var.dns_entry_name
  responsible_person = var.dns_responsible_person
  ttl                = 900
  type               = "a"
}

