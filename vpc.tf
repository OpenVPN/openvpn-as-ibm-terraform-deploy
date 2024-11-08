resource "ibm_is_vpc" "vpc" {
  name = var.vpc_name
}

resource "ibm_is_subnet" "subnet" {
  vpc             = ibm_is_vpc.vpc.id
  name            = var.subnet_name
  ipv4_cidr_block = var.cidr_block
  zone            = var.zone_region
}

resource "ibm_is_public_gateway" "public_gateway" {
  name = var.public_gateway_name
  vpc  = ibm_is_vpc.vpc.id
  zone = var.zone_region
}

resource "ibm_is_security_group" "sg" {
  name = var.security_group_name
  vpc  = ibm_is_vpc.vpc.id
}

resource "ibm_is_security_group_rule" "allow_vpn_ports" {
  direction  = "inbound"
  group      = ibm_is_security_group.sg.id
  ip_version = "ipv4"
  remote     = "0.0.0.0/0"

  tcp {
    port_min = 22
    port_max = 443
  }
}
resource "ibm_is_security_group_rule" "allow_all_outbound" {
  direction  = "outbound"
  group      = ibm_is_security_group.sg.id
  remote     = "0.0.0.0/0"
  ip_version = "ipv4"
}