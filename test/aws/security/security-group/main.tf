terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.48.0"
    }
  }
}

provider "aws" {
  region = "us-west-1"
}

module "vpc" {
  source = "../../../../aws/network/vpc"

  vpc_cidr = "172.41.0.0/16"
  vpc_name = "test-vpc"
}

module "security_group" {
  source = "../../../../aws/security/security-group"

  vpc_id              = module.vpc.vpc_id
  security_group_name = "test-security-group"

  ingress_rules = {
    ssh = {
      name        = "ssh"
      type        = "ingress"
      from_port   = "22"
      to_port     = "22"
      ip_protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    app = {
      name        = "app"
      type        = "ingress"
      from_port   = "8080"
      to_port     = "8080"
      ip_protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
