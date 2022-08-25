resource "aws_internet_gateway" "StudentPlacement-integration-IG" {
  vpc_id = aws_vpc.StudentPlacement-integration-dev.id

  tags = {
    Name = "StudentPlacement-integration-IG"
  }
}

resource "aws_nat_gateway" "StudentPlacement-integration-nat-Gateway" {
  allocation_id = "${aws_eip.StudentPlacement-integration-eip-a.id}"
  subnet_id     = "${aws_subnet.StudentPlacement-integration-public-subnet-1a.id}"
 tags ={
          Name = "StudentPlacement-integration-nat-Gateway"
      }
}

resource "aws_eip" "StudentPlacement-integration-eip-a" {
  vpc      = true
}