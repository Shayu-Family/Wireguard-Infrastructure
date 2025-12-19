#region Server Primary IPs

resource "hcloud_primary_ip" "wireguard_primary_ipv6" {
  name          = "wireguard-primary-ip6"
  datacenter    = var.target_datacenter
  type          = "ipv6"
  assignee_type = "server"
  auto_delete = true
  labels = {
    "role"   : "wireguard-server",
    "created_by" : "opentofu"
  }
}

resource "hcloud_primary_ip" "wireguard_primary_ipv4" {
  count         = var.wireguard_server_include_public_ipv4 ? 1 : 0
  
  name          = "wireguard-primary-ipv4"
  datacenter    = var.target_datacenter
  type          = "ipv4"
  assignee_type = "server"
  auto_delete = true
  labels = {
    "role"   : "wireguard-server",
    "created_by" : "opentofu"
  }
}

#endregion

resource "hcloud_firewall" "wireguard_server_firewall" {
  name = "wireguard-server-firewall"

  labels = {
    "role"   : "wireguard-server"
    "created_by" : "opentofu"
  }

  # NOTE: Special Case to accept RTSP traffic.
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
}

resource "hcloud_server" "wireguard_server" {
  name        = "wireguard-server"
  server_type = var.wireguard_server_type
  image       = "ubuntu-24.04"
  datacenter  = var.target_datacenter

  network {
    network_id = hcloud_network.main_network.id
    ip         = var.wireguard_server_private_ip
    alias_ips  = var.wireguard_server_private_ip_alias
  }

  public_net {
    ipv4_enabled = var.wireguard_server_include_public_ipv4
    ipv4         = var.wireguard_server_include_public_ipv4 ? hcloud_primary_ip.wireguard_primary_ipv4[0].id : null

    ipv6_enabled = true
    ipv6         = hcloud_primary_ip.wireguard_primary_ipv6.id
  }

  ssh_keys = [
    hcloud_ssh_key.opentofu_automation_key.id
  ]

  firewall_ids = [ hcloud_firewall.wireguard_server_firewall.id ]

  labels = {
    "role"   : "wireguard-server",
    "created_by" : "opentofu"
  }
  
  depends_on = [
    hcloud_network_subnet.public_subnet
  ]
}