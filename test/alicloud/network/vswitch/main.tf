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

# 先创建 VPC，供 vswitch 使用
module "vpc" {
    source   = "../../../../alicloud/network/vpc"
    vpc_name = "test-vswitch-vpc"
    vpc_cidr = "10.1.0.0/16"
}

module "vswitch" {
    source = "../../../../alicloud/network/vswitch"

    vpc_id        = module.vpc.vpc_id
    vpc_name      = module.vpc.vpc_name
    vswitch_cidr  = "172.16.0.0/24"
    vswitch_zone  = "cn-shanghai-b"
}