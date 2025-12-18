output "wireguard_eip_public_ip" {
  value       = aws_eip.wireguard_eip.public_ip
  description = "The Elastic IP address associated with the Wireguard server"
}