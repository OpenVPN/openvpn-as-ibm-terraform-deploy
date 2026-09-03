output "openvpn_public_ip" {
  description = "Public (floating) IP address of the OpenVPN server."
  value       = local.public_ip
}

output "openvpn_instance_id" {
  description = "The instance ID of the OpenVPN server"
  value       = ibm_is_instance.openvpn_instance.id
}

output "dns_record" {
  description = "The DNS record of the OpenVPN server, or empty if no DNS domain/entry was configured."
  value       = var.dns_domain_name != "" && var.dns_entry_name != "" ? "${var.dns_entry_name}.${var.dns_domain_name}" : ""
}

output "admin_user" {
  description = "OpenVPN Access Server admin username."
  value       = "openvpn"
}

output "admin_password" {
  description = "OpenVPN Access Server admin password."
  value       = nonsensitive(random_password.admin.result)
}

output "admin_url" {
  description = "URL for the OpenVPN Access Server admin web UI."
  value       = "https://${local.public_ip}:943/admin"
}

output "site_url" {
  description = "URL for the OpenVPN Access Server client web UI."
  value       = "https://${local.public_ip}/"
}
