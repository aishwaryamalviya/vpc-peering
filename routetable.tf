resource "aws_route_table" "Public-Subnetvpc1-RT" {
  vpc_id = aws_vpc.customvpc1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Internet_Gateway.id
  }

  tags = {
    Name = "Public-Subnetvpc1-RT"
  }
}

resource "aws_route_table_association" "RT-IG-Association" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.Public-Subnetvpc1-RT.id
}




resource "aws_route_table" "Private-Subnetvpc1-RT" {
  vpc_id = aws_vpc.customvpc1.id
  route {
    cidr_block = "172.0.0.0/16"
    #gateway_id = aws_nat_gateway.natgateway.id
    vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.natgateway.id
  }

  tags = {
    Name = "Private-Subnetvpc1-RT"
  }
}

resource "aws_route_table_association" "RT-IG-Association2" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.Private-Subnetvpc1-RT.id
}




resource "aws_route_table" "Private-Subnetvpc2-RT" {
  vpc_id = aws_vpc.customvpc2.id
  route {
    cidr_block = "10.0.0.0/16"
    vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
  }

  tags = {
    Name = "Private-Subnetvpc2-RT"
  }
}

resource "aws_route_table_association" "RT-IG-Associationvpc2" {
  subnet_id      = aws_subnet.subnetvpc2.id
  route_table_id = aws_route_table.Private-Subnetvpc2-RT.id
}

