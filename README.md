
# OpenVPN Access Server Deployment on IBM Cloud Using Terraform

This Terraform project automates the deployment of an **OpenVPN Access Server**. The OpenVPN Access Server is installed on a generic Linux instance using a custom script executed via **cloud-init** during the provisioning process.

## Prerequisites

- IBM Cloud account with permissions to manage VPC, Subnet, and instances.
- An **IBM Cloud API Key**.
- SSH key created and uploaded to IBM Cloud.

## Input Variables

The key variables include:

- `ibmcloud_api_key`: IBM Cloud API key for authentication.
- `region`: The region where resources will be deployed (`us-east`).
- `vpc_name`: Name of the VPC.
- `subnet_name`: Name of the subnet.
- `instance_name`: Name of the OpenVPN instance.
- `instance_profile`: Instance profile (`bx2-2x8`).
- `ssh_key_name`: SSH key to access the instance.
- `security_group_name`: Name of the security group.
- `cidr_block`: CIDR block for the subnet (`10.0.0.0/24`).
- `image_name`: Base Linux image (`ubuntu-20-04-amd64`).

## Project Structure

```bash
.
├── provider.tf              # Defines the IBM Cloud provider
├── var.tf                   # Input variables
├── vpc.tf                   # VPC, Subnet, and Security Group setup
├── instance.tf              # Instance configuration and cloud-init
├── image.tf                 # Base image configuration
├── output.tf                # Outputs for public IP and instance ID
├── user_data.conf           # cloud-init script for OpenVPN setup
└── README.md                # Project documentation
```
