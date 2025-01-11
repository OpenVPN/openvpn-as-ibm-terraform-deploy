# VPC creation
resource "ibm_is_vpc" "vpc" {
  count = var.vpc_create ? 1 : 0
  name  = var.vpc_name
}

# Use either created or existing VPC
data "ibm_is_vpc" "existing_vpc" {
  count = var.vpc_create ? 0 : 1
  name  = var.vpc_existing_name
}

# Subnet creation
resource "ibm_is_subnet" "subnet" {
  vpc             = var.vpc_create ? ibm_is_vpc.vpc[0].id : data.ibm_is_vpc.existing_vpc[0].id
  name            = var.vpc_subnet_name
  ipv4_cidr_block = var.vpc_cidr_block
  zone            = var.region_zone
}

# Public Gateway creation
resource "ibm_is_public_gateway" "public_gateway" {
  count = var.vpc_create ? 1 : 0
  name  = var.vpc_public_gateway_name
  vpc   = ibm_is_vpc.vpc[0].id
  zone  = var.region_zone
}

# Security Group creation
resource "ibm_is_security_group" "sg" {
  name = var.vpc_security_group_name
  vpc  = var.vpc_create ? ibm_is_vpc.vpc[0].id : data.ibm_is_vpc.existing_vpc[0].id
}

resource "ibm_is_security_group_rule" "allow_tcp_22" {
  direction  = "inbound"
  group      = ibm_is_security_group.sg.id
  ip_version = "ipv4"
  remote     = "0.0.0.0/0"

  tcp {
    port_min = 22
    port_max = 22
  }
}

resource "ibm_is_security_group_rule" "allow_tcp_443" {
  direction  = "inbound"
  group      = ibm_is_security_group.sg.id
  ip_version = "ipv4"
  remote     = "0.0.0.0/0"

  tcp {
    port_min = 443
    port_max = 443
  }
}

resource "ibm_is_security_group_rule" "allow_tcp_943" {
  direction  = "inbound"
  group      = ibm_is_security_group.sg.id
  ip_version = "ipv4"
  remote     = "0.0.0.0/0"

  tcp {
    port_min = 943
    port_max = 943
  }
}

resource "ibm_is_security_group_rule" "allow_tcp_945" {
  direction  = "inbound"
  group      = ibm_is_security_group.sg.id
  ip_version = "ipv4"
  remote     = "0.0.0.0/0"

  tcp {
    port_min = 945
    port_max = 945
  }
}

resource "ibm_is_security_group_rule" "allow_udp_1194" {
  direction  = "inbound"
  group      = ibm_is_security_group.sg.id
  ip_version = "ipv4"
  remote     = "0.0.0.0/0"

  udp {
    port_min = 1194
    port_max = 1194
  }
}

resource "ibm_is_security_group_rule" "allow_all_outbound" {
  direction  = "outbound"
  group      = ibm_is_security_group.sg.id
  remote     = "0.0.0.0/0"
  ip_version = "ipv4"
}