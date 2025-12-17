resource "hcloud_primary_ip" "sg_wireguard_primary_ip" {
  name          = "sg-wireguard-primary-ip"
  datacenter    = "sin-dc1"
  type          = "ipv6"
  assignee_type = "server"
  auto_delete = true
  labels = {
    "region" : "singapore",
    "role"   : "wireguard"
  }
}

resource "hcloud_firewall" "wireguard_server_firewall" {
  name = "wireguard-server-firewall"

  labels = {
    "role"   : "wireguard"
  }

  rule {
    direction = "in"
    protocol  = "tcp"
    description = "RTSP"
    port      = "554"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  rule {
    direction = "in"
    protocol  = "udp"
    description = "RTSP via UDP"
    port      = "554"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  rule {
    direction = "in"
    protocol  = "udp"
    description = "Wireguard VPN"
    port      = "51820"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  # TODO: Change SSH port to 20222 and use user script to update ssh config
  rule {
    direction = "in"
    protocol  = "tcp"
    description = "SSH Access"
    port      = "22"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  rule {
    direction = "out"
    protocol  = "tcp"
    description = "Allow all TCP egress"
    port      = "any"
    destination_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  rule {
    direction = "out"
    protocol  = "udp"
    description = "Allow all UDP egress"
    port      = "any"
    destination_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  rule {
    direction = "out"
    protocol  = "icmp"
    description = "Allow all ICMP egress"
    destination_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }
}

resource "hcloud_server" "sg_wireguard_server" {
  name        = "sg-wireguard-server"
  server_type = "cpx12"
  image       = "ubuntu-24.04"
  datacenter  = "sin-dc1"

  network {
    network_id = hcloud_network.sg_network.id
    ip         = var.sg_wireguard_server_private_ip
    alias_ips  = var.sg_wireguard_server_private_ip_alias
  }

  public_net {
    ipv4_enabled = var.sg_wireguard_server_include_public_ipv4
    ipv6_enabled = true
    ipv6         = hcloud_primary_ip.sg_wireguard_primary_ip.id
  }

  ssh_keys = [
    hcloud_ssh_key.main.id
  ]

  firewall_ids = [ hcloud_firewall.wireguard_server_firewall.id ]

  labels = {
    "region" : "singapore",
    "role"   : "wireguard-server"
  }
  
  depends_on = [
    hcloud_network_subnet.sg_subnet_01
  ]
}