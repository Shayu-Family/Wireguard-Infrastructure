#region Wireguard Server Info

output "wireguard_server_id" {
  value       = hcloud_server.wireguard_server.id
  description = "The ID of the Wireguard server."
}

#endregion

#region Network Info

output "network_id" {
  value       = hcloud_network.main_network.id
  description = "ID of the created Network."
}

output "public_subnet_id" {
  value       = hcloud_network_subnet.public_subnet.id
  description = "ID of the created Public Subnet 1."
}

output "private_subnet_id" {
  value       = hcloud_network_subnet.private_subnet.id
  description = "ID of the created Private Subnet 2."
}

#endregion