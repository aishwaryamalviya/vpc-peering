resource "aws_subnet" "subnet1" {
  vpc_id            = aws_vpc.customvpc1.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "Public Subnet"
  }
}
resource "aws_subnet" "subnet2" {
  vpc_id            = aws_vpc.customvpc1.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "Private Subnet"
  }
}
resource "aws_subnet" "subnetvpc2" {
  vpc_id            = aws_vpc.customvpc2.id
  cidr_block        = "172.0.0.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "Private Subnetvpc2"
  }
}

