output "openvpn_public_ip" {
  value = ibm_is_instance.openvpn_instance.primary_network_interface.0.primary_ipv4_address
}


output "openvpn_instance_id" {
  description = "The instance ID of the OpenVPN server"
  value       = ibm_is_instance.openvpn_instance.id
}
