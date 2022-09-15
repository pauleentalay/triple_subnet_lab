resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.triple_subnet_vpc.id

  tags = {
    Name = "main"
  }
}

resource "aws_eip" "eip" {
  vpc      = true
}

resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public_1.id

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.example]
}

