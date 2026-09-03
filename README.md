
# OpenVPN Access Server Deployment on IBM Cloud Using Terraform

This Terraform project automates the deployment of an **OpenVPN Access Server** on IBM Cloud VPC. OpenVPN Access Server is installed on a Ubuntu instance via a **cloud-init** script that runs during first boot.

## Prerequisites

- IBM Cloud account with permissions to manage VPC, Subnet, Security Groups, and instances.
- An **IBM Cloud API Key**, exported as the `IC_API_KEY` (or `IBMCLOUD_API_KEY`) environment variable - the IBM Terraform provider reads it directly from the environment; it is not a Terraform variable in this module.
- An SSH key already created/uploaded to IBM Cloud (referenced by name via `ssh_public_key`).

## Input Variables

| Name | Description | Default |
|---|---|---|
| `prefix` | Prefix for all resource names. | `openvpn-as` |
| `region` | IBM Cloud region name. | `us-east` |
| `region_zone` | Availability zone within the specified region. | `us-east-1` |
| `instance_profile` | VM size and family profile. | `cx2-2x4` |
| `image_name` | Image name for the Linux server. | `ibm-ubuntu-24-04-4-minimal-amd64-7` |
| `ssh_public_key` | Pre-created SSH public key name for instance access. | `""` |
| `vpc_existing_name` | Name of an existing VPC to use instead of creating one. | `""` |
| `enable_letsencrypt` | Automatically request a Let's Encrypt TLS certificate for the instance's public IP. Self-skips if no public IP is detected. | `true` |
| `dns_domain_name` | DNS domain name (e.g., `example.com`). | `""` |
| `dns_entry_name` | DNS entry name (e.g., `www`). | `""` |
| `dns_responsible_person` | Email address of the responsible person for the DNS entry. | `admin@example.com` |

## Outputs

| Name | Description |
|---|---|
| `openvpn_public_ip` | Public (floating) IP address of the server. |
| `openvpn_instance_id` | The instance ID of the OpenVPN server. |
| `dns_record` | The configured DNS record, or empty if none was configured. |
| `admin_user` | OpenVPN Access Server admin username (`openvpn`). |
| `admin_password` | Randomly generated admin password. |
| `admin_url` | URL for the Access Server admin web UI. |
| `site_url` | URL for the Access Server client web UI. |

## Project Structure

```bash
.
├── provider.tf              # IBM Cloud + random provider configuration
├── vars.tf                  # Input variables
├── vpc.tf                   # VPC, Subnet, Public Gateway, and Security Group setup
├── instance.tf              # Instance, floating IP, DNS, and admin password
├── output.tf                # Outputs: IP, instance ID, admin credentials, URLs
├── scripts/cloud-config.yaml # cloud-init script that installs and configures Access Server
└── README.md                 # Project documentation
```
