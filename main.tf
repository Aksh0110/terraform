# Creating VPC
resource "aws_vpc" "terraform" {
  cidr_block = "192.100.0.0/16"

  tags = {
    Name = "terraform"
  }
}

resource "aws_security_group" "vpctestsg" {
  name        = "vpctestsg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.terraform.id

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
  vpc_id     = aws_vpc.terraform.id
  cidr_block = "192.100.1.0/24"

  tags = {
    Name = "public"
  }
}
# Creating internet gateway
resource "aws_internet_gateway" "igw-tf" {
  vpc_id = aws_vpc.terraform.id

  tags = {
    Name = "igw-tf"
  }
}

# Creating route table for public subnet
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.terraform.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-k8s.id
  }
  tags = {
    Name = "public"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}
