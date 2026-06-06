terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}


data "aws_availability_zones" "available" {}

resource "aws_subnet" "subnet" {
  for_each = var.public_subnets

  vpc_id     = var.vpc_id
  cidr_block = each.value.cidr
  map_public_ip_on_launch = var.map_public_ip_on_launch
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = each.value.name
  }
}