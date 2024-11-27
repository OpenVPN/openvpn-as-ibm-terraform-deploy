# VPC creation
resource "ibm_is_vpc" "vpc" {
  count = var.create_vpc ? 1 : 0
  name  = var.vpc_name
}

# Use either created or existing VPC
data "ibm_is_vpc" "existing_vpc" {
  count = var.create_vpc ? 0 : 1
  name  = var.existing_vpc_name
}

# Subnet creation
resource "ibm_is_subnet" "subnet" {
  vpc             = var.create_vpc ? ibm_is_vpc.vpc[0].id : data.ibm_is_vpc.existing_vpc[0].id
  name            = var.subnet_name
  ipv4_cidr_block = var.cidr_block
  zone            = var.zone_region
}

# Public Gateway creation
resource "ibm_is_public_gateway" "public_gateway" {
  count = var.create_vpc ? 1 : 0
  name  = var.public_gateway_name
  vpc   = ibm_is_vpc.vpc[0].id
  zone  = var.zone_region
}

# Security Group creation
resource "ibm_is_security_group" "sg" {
  name = var.security_group_name
  vpc  = var.create_vpc ? ibm_is_vpc.vpc[0].id : data.ibm_is_vpc.existing_vpc[0].id
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