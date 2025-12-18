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