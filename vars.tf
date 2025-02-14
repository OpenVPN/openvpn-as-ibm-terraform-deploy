variable "dns_domain_name" {
  type        = string
  description = "DNS domain name (e.g., example.com)."
  default     = ""
}

variable "dns_entry_name" {
  type        = string
  description = "DNS entry name (e.g., www)."
  default     = ""
}

variable "dns_responsible_person" {
  type        = string
  description = "Email address of the responsible person for the DNS entry"
  default     = "admin@example.com"
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

variable "prefix" {
  type        = string
  description = "Prefix for the all resources names."
  default     = "openvpn-as"
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
  type        = string
  description = "Pre-created SSH public key name for instance access."
  default     = ""
}

variable "vpc_existing_name" {
  type        = string
  description = "The name of the existing VPC to use when vpc_create is set to false."
  default     = ""
}
