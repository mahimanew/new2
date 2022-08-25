resource "aws_subnet" "StudentPlacement-integration-restricted-subnet-1c" {
  vpc_id     = aws_vpc.StudentPlacement-integration-dev.id
  cidr_block = "172.24.3.192/27"
  map_public_ip_on_launch = false
  availability_zone = "us-east-1c"

  tags = {
    Name = "StudentPlacement-integration-restricted-subnet-1c"
  }
}

