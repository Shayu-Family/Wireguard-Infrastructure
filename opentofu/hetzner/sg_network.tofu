resource "hcloud_network" "sg_network" {
  name     = "sg-network"
  ip_range =  var.sg_network_ip_range
}

#region Subnets

resource "hcloud_network_subnet" "sg_subnet_01" {
  network_id   = hcloud_network.sg_network.id
  type         = "cloud"
  network_zone = "ap-southeast"
  ip_range     = var.sg_subnet_01_ip_range
}

resource "hcloud_network_subnet" "sg_subnet_02" {
  network_id   = hcloud_network.sg_network.id
  type         = "cloud"
  network_zone = "ap-southeast"
  ip_range     = var.sg_subnet_02_ip_range
}

#endregion