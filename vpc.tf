resource "aws_vpc" "customvpc1" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "customvpc1"
  }
}
resource "aws_vpc" "customvpc2" {
  cidr_block = "172.0.0.0/16"
  tags = {
    Name = "customvpc2"
  }
}


resource "aws_vpc_peering_connection" "vpc_peering" {
  peer_owner_id = "248217947790"
  peer_vpc_id   = aws_vpc.customvpc2.id
  vpc_id        = aws_vpc.customvpc1.id
  peer_region   = "us-east-1"
  auto_accept   = false
}
resource "aws_vpc_peering_connection_accepter" "peering_acceptance" {
  provider                  = aws.peer
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
  auto_accept               = true

  tags = {
    Side = "Accepter"
  }
}

