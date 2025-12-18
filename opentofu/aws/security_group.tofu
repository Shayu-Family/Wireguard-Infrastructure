#region Allow SSH Security Group

resource "aws_security_group" "allow_ssh" {
  name        = "allow-ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.shayu_vpc.id

  tags = {
    created_by = "opentofu",
    Name = "allow-ssh"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ingress_rule" {
  security_group_id = aws_security_group.allow_ssh.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}

#endregion

#region Allow Web Protocols Security Group

resource "aws_security_group" "allow_web_protocols" {
  name        = "allow-web-protocols"
  description = "Allow HTTP and HTTPS inbound traffic"
  vpc_id      = aws_vpc.shayu_vpc.id

  tags = {
    created_by = "opentofu",
    Name = "allow-web-protocols"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_ingress_rule" {
  security_group_id = aws_security_group.allow_web_protocols.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_https_ingress_rule" {
  security_group_id = aws_security_group.allow_web_protocols.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 443
  ip_protocol = "tcp"
  to_port     = 443
}

#endregion

#region Allow RTSP Security Group

resource "aws_security_group" "allow_rtsp" {
  name        = "allow-rtsp"
  description = "Allow RTSP inbound traffic"
  vpc_id      = aws_vpc.shayu_vpc.id

  tags = {
    created_by = "opentofu",
    Name = "allow-rtsp"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_rtsp_tcp_ingress_rule" {
  security_group_id = aws_security_group.allow_rtsp.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 554
  ip_protocol = "tcp"
  to_port     = 554
}

resource "aws_vpc_security_group_ingress_rule" "allow_rtsp_udp_ingress_rule" {
  security_group_id = aws_security_group.allow_rtsp.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 554
  ip_protocol = "udp"
  to_port     = 554
}

#endregion

#region Allow Wireguard Security Group

resource "aws_security_group" "allow_wireguard" {
  name        = "allow-wireguard"
  description = "Allow Wireguard inbound traffic"
  vpc_id      = aws_vpc.shayu_vpc.id

  tags = {
    created_by = "opentofu",
    Name = "allow-wireguard"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_wireguard_udp_ingress_rule" {
  security_group_id = aws_security_group.allow_wireguard.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 51820
  ip_protocol = "udp"
  to_port     = 51820
}

#endregion