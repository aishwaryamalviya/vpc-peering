resource "aws_internet_gateway" "Internet_Gateway" {
  vpc_id = aws_vpc.customvpc1.id
  tags = {
    Name = "Internet_Gateway"
  }
}
