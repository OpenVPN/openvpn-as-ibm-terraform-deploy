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
