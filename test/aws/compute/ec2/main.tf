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
    vpc_id                  = module.vpc.vpc_id
    subnet_cidr             = "172.41.1.0/24"
    subnet_name             = "test-subnet"
    map_public_ip_on_launch = true
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

module "igw" {
  source = "../../../../aws/network/igw"
  
  vpc_id   = module.vpc.vpc_id
  vpc_name = module.vpc.vpc_name
}

module "route_table" {
  source = "../../../../aws/network/route_table"

  vpc_id   = module.vpc.vpc_id
  igw_id   = module.igw.igw_id
  subnet_id = module.subnet.subnet_id
  vpc_name = module.vpc.vpc_name
}

data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"] # Canonical（Ubuntu 官方）

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

module "ec2_instance" {
  source = "../../../../aws/compute/ec2"

  ami_id        = data.aws_ami.ubuntu.id
  instance_type  = "t3.micro"
  subnet_id      = module.subnet.subnet_id
  instance_name  = "test-ec2-instance"
  instance_count = 1

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y && sudo apt install ec2-instance-connect -y
              sudo apt install docker.io -y
              sudo systemctl enable docker --now
              EOF

  vpc_security_group_ids  = [module.security_group.security_group_id]
}