#region VPCs & Subnets

resource "aws_vpc" "shayu_vpc" {
  cidr_block       = var.vpc_cidr_block

  tags = {
    created_by = "opentofu",
    Name       = "shayu-vpc"
  }
}

resource "aws_subnet" "shayu_private_subnet" {
  vpc_id     = aws_vpc.shayu_vpc.id
  cidr_block = var.private_subnet_cidr_block

  tags = {
    created_by = "opentofu",
    Name = "shayu-private-subnet"
  }
}

resource "aws_subnet" "shayu_public_subnet" {
  vpc_id     = aws_vpc.shayu_vpc.id
  cidr_block = var.public_subnet_cidr_block

  tags = {
    created_by = "opentofu",
    Name = "shayu-public-subnet"
  }
}

#endregion

#region Gateways

resource "aws_internet_gateway" "shayu_internet_gateway" {
  vpc_id = aws_vpc.shayu_vpc.id

  tags = {
    created_by = "opentofu",
    Name = "shayu-internet-gateway"
  }
}

resource "aws_nat_gateway" "shayu_nat_gateway" {
  vpc_id            = aws_vpc.shayu_vpc.id
  availability_mode = "regional"

  tags = {
      created_by = "opentofu",
      Name = "shayu-nat-gateway"
  }
}

#endregion

#region Route Tables

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.shayu_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.shayu_internet_gateway.id
  }

  tags = {
    created_by = "opentofu",
    Name = "shayu-public-route-table"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.shayu_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.shayu_nat_gateway.id
  }

  tags = {
    created_by = "opentofu",
    Name = "shayu-private-route-table"
  }
}

#endregion

resource "aws_route_table_association" "public_route_table_association" {
  subnet_id      = aws_subnet.shayu_public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private_route_table_association" {
  subnet_id      = aws_subnet.shayu_private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}