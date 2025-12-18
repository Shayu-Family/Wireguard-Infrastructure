resource "aws_network_interface" "wireguard_server_nic" {
  subnet_id   = aws_subnet.shayu_public_subnet.id
  private_ips = var.wireguard_server_private_ips

  security_groups = [
    aws_security_group.allow_ssh.id,
    aws_security_group.allow_rtsp.id,
    aws_security_group.allow_wireguard.id
  ]

  tags = {
    created_by = "opentofu",
    Name = "wireguard-server-eip-nic"
  }
}

resource "aws_instance" "wireguard_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.small"
  key_name      = aws_key_pair.shayu_key_pair.key_name

  primary_network_interface {
    network_interface_id = aws_network_interface.wireguard_server_nic.id
  }

  root_block_device {
    volume_type = "standard"
    volume_size = 32

    tags = {
      created_by = "opentofu",
      Name = "wireguard-server-root-block-device"
    }
  }

  tags = {
    created_by = "opentofu",
    Name = "wireguard-server-instance"
  }

  depends_on = [ aws_internet_gateway.shayu_internet_gateway ]
}

resource "aws_eip" "wireguard_eip" {
  network_interface = aws_network_interface.wireguard_server_nic.id
  domain   = "vpc"

  tags = {
    created_by = "opentofu",
    Name = "wireguard-server-eip"
  }
}