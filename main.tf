terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_instance" "demo-server" {
  ami           = "ami-05c13eab67c5d8861" 
  instance_type = "t2.micro"
  tags = {
    Name = "demo-server"
  }
}
