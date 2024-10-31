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
  default = "openvpn-subnet"
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
  default = "openvpn-sg"
}

variable "cidr_block" {
  type        = string
  description = "CIDR block for the subnet"
}

variable "user_data" {
  type        = string
  default     = "user_data.conf"
  description = "The Custom Bootstrap Data file name."
}