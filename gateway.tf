resource "aws_internet_gateway" "gw_vpc" {
  vpc_id = aws_vpc.triple_subnet_vpc.id

  tags = {
    Name = "main"
  }
}

resource "aws_eip" "eip" {
  vpc      = true
}

resource "aws_nat_gateway" "nat_public_1" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public_1.id

  tags = {
    Name = "gw_NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw_vpc]
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.triple_subnet_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw_vpc.id
  }

}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.triple_subnet_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_public_1.id
  }
}

resource "aws_route_table_association" "public_1" {
    subnet_id = aws_subnet.public_1.id
    route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_2" {
    subnet_id = aws_subnet.public_2.id
    route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_3" {
    subnet_id = aws_subnet.public_3.id
    route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private_1" {
    subnet_id = aws_subnet.private_1.id
    route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_2" {
    subnet_id = aws_subnet.private_2.id
    route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_3" {
    subnet_id = aws_subnet.private_3.id
    route_table_id = aws_route_table.private_route_table.id
}

