resource "aws_vpc" "triple_subnet_vpc" {                # Creating VPC here
    cidr_block = "192.168.0.0/16"
 }

resource "aws_subnet" "public_1" {
  vpc_id     = aws_vpc.triple_subnet_vpc.id
  cidr_block = "192.168.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "eu-central-1a"
  tags = {
    Name = "triple_public_1"
  }
}

resource "aws_subnet" "public_2" {
  vpc_id     = aws_vpc.triple_subnet_vpc.id
  cidr_block = "192.168.2.0/24"
  map_public_ip_on_launch = true
  availability_zone = "eu-central-1b"

  tags = {
    Name = "triple_public_2"
  }
}

resource "aws_subnet" "public_3" {
  vpc_id     = aws_vpc.triple_subnet_vpc.id
  cidr_block = "192.168.3.0/24"
  map_public_ip_on_launch = true
  availability_zone = "eu-central-1c"

  tags = {
    Name = "triple_public_3"
  }
}

resource "aws_subnet" "private_1" {
  vpc_id     = aws_vpc.triple_subnet_vpc.id
  cidr_block = "192.168.11.0/24"
  availability_zone = "eu-central-1a"

  tags = {
    Name = "triple_private_1"
  }
}

resource "aws_subnet" "private_2" {
  vpc_id     = aws_vpc.triple_subnet_vpc.id
  cidr_block = "192.168.12.0/24"
  availability_zone = "eu-central-1b"

  tags = {
    Name = "triple_private_2"
  }
}

resource "aws_subnet" "private_3" {
  vpc_id     = aws_vpc.triple_subnet_vpc.id
  cidr_block = "192.168.13.0/24"
  availability_zone = "eu-central-1c"

  tags = {
    Name = "triple_private_3"
  }
}