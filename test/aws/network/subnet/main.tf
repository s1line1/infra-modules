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

module "subnet" {
    source = "../../../../aws/network/subnet"
    vpc_id       = module.vpc.vpc_id
    map_public_ip_on_launch = true

    public_subnets = {
        subnet1 = {
            cidr = "172.41.1.0/24"
            name = "test-subnet-1"
        }
        subnet2 = {
            cidr = "172.41.2.0/24"
            name = "test-subnet-2"
        }
    }
}