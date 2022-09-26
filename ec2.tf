resource "aws_instance" "pubvm1" {
  ami                         = "ami-0149b2da6ceec4bb0"
  instance_type               = "t2.medium"
  security_groups             = [aws_security_group.allow_tls.id]
  subnet_id                   = aws_subnet.subnet1.id
  key_name                    = "test"
  associate_public_ip_address = true

  tags = {
    Name = "pubvm"
  }
}

resource "aws_instance" "privm" {
  ami                         = "ami-0149b2da6ceec4bb0"
  instance_type               = "t2.micro"
  security_groups             = [aws_security_group.allow_tls.id]
  subnet_id                   = aws_subnet.subnet2.id
  key_name                    = "test"
  associate_public_ip_address = false

  tags = {
    Name = "privm"
  }
}


resource "aws_instance" "privmvpc2" {
  ami                         = "ami-0149b2da6ceec4bb0"
  instance_type               = "t2.micro"
  security_groups             = [aws_security_group.allow_tls2.id]
  subnet_id                   = aws_subnet.subnetvpc2.id
  key_name                    = "test"
  associate_public_ip_address = false

  tags = {
    Name = "privmvpc2"
  }
}

