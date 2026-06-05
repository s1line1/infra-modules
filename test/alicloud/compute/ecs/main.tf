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
}

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

module "security_group" {
    source  = "../../../../alicloud/security/security-group"

    security_group_name = "test-security-group"
    vpc_id              = module.vpc.vpc_id

    security_group_rules = {
        ssh = {
            type       = "ingress"
            port_range  = "22/22"
            ip_protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
        springboot-demo = {
            type       = "ingress"
            port_range  = "8083/8083"
            ip_protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
}


module "this" {
    source  = "../../../../alicloud/compute/ecs"
    user_data = file("${path.module}/user_data.yaml")
    ecs_count = 2
    project_name = "test-ecs"
    vswitch_id = module.vswitch.vswitch_id
    security_group_id = module.security_group.security_group_id
    image_id = "ubuntu_20_04_x64_20G_alibase_20230612.vhd"
    instance_type = "ecs.e-c1m1.large"
    system_disk_category = "cloud_essd_entry"
    system_disk_size = 40
    key_name = "root"
    instance_charge_type = "PostPaid"
    internet_charge_type = "PayByTraffic"
    internet_max_bandwidth_out = 1
}