resource "hcloud_network" "main_network" {
  name     = "main-network"
  ip_range =  var.network_cidr_block

  labels = {
    "created_by" : "opentofu"
  }
}

#region Subnets

resource "hcloud_network_subnet" "public_subnet" {
  network_id   = hcloud_network.main_network.id
  type         = "cloud"
  network_zone = var.network_zone
  ip_range     = var.public_subnet_cidr_block
}

resource "hcloud_network_subnet" "private_subnet" {
  network_id   = hcloud_network.main_network.id
  type         = "cloud"
  network_zone = var.network_zone
  ip_range     = var.private_subnet_cidr_block
}

#endregion