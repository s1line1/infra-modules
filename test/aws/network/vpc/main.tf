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