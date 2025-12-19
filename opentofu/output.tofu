#region SG Wireguard Server

output "sg_wireguard_server_ipv6_address" {
  value       = hcloud_server.sg_wireguard_server.ipv6_address
  description = "The public IPv6 address of the Wireguard server."
}

output "sg_wireguard_server_ipv4_address" {
  value       = hcloud_server.sg_wireguard_server.ipv4_address
  description = "The public IPv4 address of the Wireguard server (if enabled)."
}

output "sg_wireguard_server_private_networks" {
  value       = hcloud_server.sg_wireguard_server.network
  description = "The private network addresses of the Wireguard server."
}

output "sg_wireguard_server_id" {
  value       = hcloud_server.sg_wireguard_server.id
  description = "The ID of the Wireguard server."
}

#endregion

#region SG Network Info

output "sg_network_id" {
  value       = hcloud_network.sg_network.id
  description = "ID of the created Singapore Network."
}

output "sg_subnet_1_id" {
  value       = hcloud_network_subnet.sg_subnet_01.id
  description = "ID of the created Singapore Subnet 1."
}

output "sg_subnet_2_id" {
  value       = hcloud_network_subnet.sg_subnet_02.id
  description = "ID of the created Singapore Subnet 2."
}

#endregion