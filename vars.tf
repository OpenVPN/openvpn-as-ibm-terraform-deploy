variable "dns_create" {
  type        = bool
  description = "Set to true to create DNS entries, or false to skip creating them."
  default     = false
}

variable "dns_domain_name" {
  type        = string
  description = "DNS domain name (e.g., example.com)."
}

variable "dns_entry_name" {
  type        = string
  description = "DNS entry name (e.g., www)."
}

variable "dns_responsible_person" {
  type        = string
  description = "Email address of the responsible person for the DNS entry"
  default     = "admin@example.com"
}

variable "ibmcloud_api_key" {
  type        = string
  description = "IBM Cloud API key for authentication."
}

variable "instance_name" {
  type        = string
  description = "OpenVPN instance name."
  default     = "openvpn-as-server"
}

variable "instance_profile" {
  default     = "cx2-2x4"
  description = "VM size and family profile (e.g., cx2-2x4)."
}

variable "image_name" {
  type        = string
  default     = "ibm-ubuntu-24-04-6-minimal-amd64-1"
  description = "Image name for the Linux server"
}

variable "region" {
  type        = string
  description = "IBM Cloud region name."
  default     = "us-east"
}

variable "region_zone" {
  type        = string
  description = "Availability zone name within the specified region."
  default     = "us-east-1"
}

variable "ssh_public_key" {
  default     = ""
  description = "Pre-created SSH public key name for instance access."
}

variable "vpc_cidr_block" {
  type        = string
  description = "The CIDR block for the VPC subnet (e.g., 192.168.0.0/16)."
}

variable "vpc_create" {
  type        = bool
  description = "Set to true to create a new VPC, or false to use an existing VPC."
  default     = false
}

variable "vpc_existing_name" {
  type        = string
  description = "The name of the existing VPC to use when vpc_create is set to false."
  default     = ""
}

variable "vpc_name" {
  type        = string
  description = "The name to assign to the new VPC."
  default     = "openvpn-vpc"
}

variable "vpc_public_gateway_name" {
  type        = string
  description = "The name of the public gateway to attach to the VPC."
  default     = "openvpn-pgw"
}

variable "vpc_security_group_name" {
  type        = string
  description = "The name of the security group for the VPC."
  default     = "openvpn-sg"
}

variable "vpc_subnet_name" {
  type        = string
  description = "The name of the subnet in the VPC."
  default     = "openvpn-subnet"
}