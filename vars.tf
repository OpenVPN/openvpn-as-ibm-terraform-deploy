variable "ssh_public_key" {
  default     = ""
  description = "Public ssh ID name. This needs to be pre-created."
}

variable "ibmcloud_api_key" {
  type        = string
  description = "IBM Cloud API key"
}

variable "region" {
  type        = string
  description = "IBM Cloud region"
  default     = "us-east"
}

variable "zone_region" {
  type        = string
  description = "IBM Cloud region"
  default     = "us-east-1"
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
  default     = "openvpn-vpc"
}

variable "subnet_name" {
  type        = string
  description = "Name of the Subnet"
  default     = "openvpn-subnet"
}

variable "instance_name" {
  type        = string
  description = "Name of the OpenVPN instance"
  default     = "openvpn-as-server"
}

variable "instance_profile" {
  default     = "cx2-2x4"
  description = "VM size and family"
}

variable "image_name" {
  type        = string
  default     = "ibm-ubuntu-20-04-6-minimal-amd64-6"
  description = "Image name for the Linux server"
}

variable "security_group_name" {
  type        = string
  description = "Name of the security group"
  default     = "openvpn-sg"
}

variable "public_gateway_name" {
  type        = string
  description = "Name of the public gateway"
  default     = "openvpn-pgw"
}

variable "cidr_block" {
  type        = string
  description = "CIDR block for the subnet"
}

variable "dns_domain_name" {
  type        = string
  description = "Name of the DNS domain (example.com)"
}

variable "dns_entry_name" {
  type        = string
  description = "DNS entry name (www)"
}

variable "responsible_person" {
  type        = string
  description = "Email address of the responsible person for the DNS entry"
  default     = "admin@example.com"
}


variable "create_vpc" {
  type        = bool
  description = "Set to true to create a new VPC, false to use an existing VPC"
  default     = false
}

variable "existing_vpc_name" {
  type        = string
  description = "Name of the existing VPC to use when create_vpc is false"
  default     = ""
}
