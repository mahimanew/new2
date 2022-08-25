resource "aws_subnet" "StudentPlacement-integration-private-subnet-1b" {
  vpc_id     = aws_vpc.StudentPlacement-integration-dev.id
  cidr_block = "172.24.3.0/25"
  map_public_ip_on_launch = false
  availability_zone = "us-east-1b"

  tags = {
    Name = "StudentPlacement-integration-private-subnet-1b"
  }
}

resource "aws_route_table" "StudentPlacement-integration-private-subnet-1b-router" {
  vpc_id = aws_vpc.StudentPlacement-integration-dev.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.StudentPlacement-integration-nat-Gateway.id
  }

   tags = {
   Name = "StudentPlacement-integration-private-subnet-1b-router"
  }
}

resource "aws_route_table_association" "StudentPlacement-integration-private-1b-association" {
  subnet_id      = aws_subnet.StudentPlacement-integration-private-subnet-1b.id
  route_table_id = aws_route_table.StudentPlacement-integration-private-subnet-1b-router.id
}