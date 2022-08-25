resource "aws_subnet" "StudentPlacement-integration-public-subnet-1b" {
  vpc_id     = aws_vpc.StudentPlacement-integration-dev.id
  cidr_block = "172.24.1.64/26"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1b"

  tags = {
    Name = "StudentPlacement-integration-public-subnet-1b"
  }
}

resource "aws_route_table" "StudentPlacement-integration-public-subnet-1b-router" {
  vpc_id = aws_vpc.StudentPlacement-integration-dev.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.StudentPlacement-integration-IG.id
  }

   tags = {
   Name = "StudentPlacement-integration-public-subnet-1b-router"
  }
}

resource "aws_route_table_association" "StudentPlacement-integration-public-1b-association" {
  subnet_id      = aws_subnet.StudentPlacement-integration-public-subnet-1b.id
  route_table_id = aws_route_table.StudentPlacement-integration-public-subnet-1b-router.id
}