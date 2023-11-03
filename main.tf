# Creating VPC
resource "aws_vpc" "k8s" {
  cidr_block = "192.168.0.0/16"

  tags = {
    Name = "k8s"
  }
}

resource "aws_security_group" "vpctestsg" {
  name        = "vpctestsg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.k8s.id

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    description = "all traffic from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "vpctestsg"
  }

# Creating public subnet
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.k8s.id
  cidr_block = "192.168.1.0/24"

  tags = {
    Name = "public"
  }
}
