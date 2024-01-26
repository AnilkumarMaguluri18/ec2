provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "Anil_ec2_instance" {
  ami                          = "ami-09694bfab577e90b0"
  instance_type                = "t2.micro"
  key_name                     = "JenkinsKey"
  vpc_security_group_ids       = [aws_security_group.my_security_group.id]
  subnet_id                    = aws_subnet.Anil_public_subnet.id
  associate_public_ip_address  = true

  tags = {
    Name = "AnilEC2Instance"
  }
}

resource "aws_route_table_association" "Anil_subnet_association" {
  subnet_id      = aws_subnet.Anil_public_subnet.id
  route_table_id = aws_route_table.Anil_public_route.id
}