terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

resource "aws_instance" "ec2_instance" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  user_data = var.user_data

  metadata_options {
    http_tokens   = "required"  # 强制使用 IMDSv2
    http_endpoint = "enabled"
  }


  tags = {
    Name = var.instance_name
  }

  vpc_security_group_ids = var.vpc_security_group_ids
}
