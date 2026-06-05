terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}


resource "aws_subnet" "subnet" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnet_cidr
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name = var.subnet_name
  }
}