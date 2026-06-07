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

  dynamic "root_block_device" {
    for_each = length(var.root_block_device) > 0 ? [var.root_block_device] : []
    content {
      volume_size           = lookup(root_block_device.value, "volume_size", null)
      volume_type           = lookup(root_block_device.value, "volume_type", null)
      throughput            = lookup(root_block_device.value, "throughput", null)
    }
  }

  tags = {
    Name = var.instance_name
  }

  vpc_security_group_ids = var.vpc_security_group_ids
}
