output "openvpn_public_ip" {
  description = "The Public IP of the OpenVPN server"
  value = ibm_is_instance.openvpn_instance.primary_network_interface.0.primary_ip
}

output "openvpn_instance_id" {
  description = "The instance ID of the OpenVPN server"
  value       = ibm_is_instance.openvpn_instance.id
}
