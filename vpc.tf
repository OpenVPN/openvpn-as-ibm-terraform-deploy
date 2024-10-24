resource "ibm_is_vpc" "vpc" {
  name = var.vpc_name
}

resource "ibm_is_subnet" "subnet" {
  vpc             = ibm_is_vpc.vpc.id
  name            = var.subnet_name
  ipv4_cidr_block = var.cidr_block
  zone            = var.region
}

resource "ibm_is_security_group" "sg" {
  name = var.security_group_name
  vpc  = ibm_is_vpc.vpc.id
}

resource "ibm_is_security_group_rule" "allow_vpn_ports" {
  direction         = "inbound"
  ip_version        = "ipv4"
  remote            = "0.0.0.0/0"
  tcp {
    port_min = 22
    port_max = 22
  }
  tcp {
    port_min = 443
    port_max = 443
  }
  security_group = ibm_is_security_group.sg.id
}
