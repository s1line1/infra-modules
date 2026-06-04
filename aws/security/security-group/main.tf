terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}


# --- 创建安全组 ---
resource "aws_security_group" "security_group" {
    name        = var.security_group_name
    description = "Security group for environment"
    vpc_id      = var.vpc_id

    tags = {
        Name = var.security_group_name
    }

    ingress = []
    egress  = []
}

# --- 将 ingress_rules 扁平化（每个 CIDR 一条规则） ---
locals {
  ingress_rules_flat = flatten([
    for rule_name, rule in var.ingress_rules : [
      for cidr in rule.cidr_blocks : {
        name        = rule.name
        key         = "${rule_name}-${cidr}"
        type        = rule.type
        from_port   = rule.from_port
        to_port     = rule.to_port
        ip_protocol = rule.ip_protocol
        cidr_blocks = [cidr]
      }
    ]
  ])
}

# --- 安全组规则 ---
resource "aws_security_group_rule" "ingress" {
    for_each          = { for r in local.ingress_rules_flat : r.key => r }
    security_group_id = aws_security_group.security_group.id
    type              = each.value.type
    from_port         = each.value.from_port
    to_port           = each.value.to_port
    protocol          = each.value.ip_protocol
    cidr_blocks       = each.value.cidr_blocks
}