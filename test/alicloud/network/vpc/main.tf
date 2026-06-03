terraform {
  required_providers {
    alicloud = {
      source  = "aliyun/alicloud"
      version = "= 1.240.0"
    }
  }
}

provider "alicloud" {
    region     = var.region
    access_key = var.access_key
    secret_key = var.secret_key
}

module "test_vpc" {
    source = "../../../../alicloud/network/vpc"

    vpc_name = "tf-test-vpc"
    vpc_cidr = "10.0.0.0/16"
}