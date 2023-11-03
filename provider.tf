terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = "us-east-1"
  access_key = "AKIARQPRZITGAOPZZZNB"
  secret_key = "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"
}
