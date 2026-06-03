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

module "vpc" {
    source   = "../../../../alicloud/network/vpc"
    vpc_name = "test-vswitch-vpc"
    vpc_cidr = "10.1.0.0/16"
}

module "security_group" {
    source  = "../../../../alicloud/security/security-group"

    security_group_name = "test-security-group"
    vpc_id              = module.vpc.vpc_id

    ingress_rules = {
        ssh = {
            port_range  = "22/22"
            ip_protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
        springboot-demo = {
            port_range  = "8083/8083"
            ip_protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
}