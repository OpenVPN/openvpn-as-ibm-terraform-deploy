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
}

variable "instance_name" {
  type        = string
  description = "Name of the OpenVPN instance"
}

variable "instance_profile" {
  type        = string
  description = "Profile for the instance"
}

variable "ssh_key_name" {
  type        = string
  description = "Name of the SSH key to attach"
}

variable "image_name" {
  type        = string
  default     = "ibm-ubuntu-20-04-6-minimal-amd64-6"
  description = "Image name for the Linux server"
}

variable "security_group_name" {
  type        = string
  description = "Name of the security group"
}

variable "cidr_block" {
  type        = string
  description = "CIDR block for the subnet"
}
