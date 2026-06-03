terraform {
  required_providers {
    alicloud = {
      source = "aliyun/alicloud"
    }
  }
}

# --- 创建安全组 ---
resource "alicloud_security_group" "security_group" {
  security_group_name = var.security_group_name
  description         = "Security group for environment"
  vpc_id              = var.vpc_id
}

# --- 将 ingress_rules 扁平化（每个 CIDR 一条规则） ---
locals {
  ingress_rules_flat = flatten([
    for rule_name, rule in var.ingress_rules : [
      for cidr in rule.cidr_blocks : {
        key         = "${rule_name}-${cidr}"
        port_range  = rule.port_range
        ip_protocol = rule.ip_protocol
        cidr_ip     = cidr
      }
    ]
  ])
}

# --- 安全组规则 ---
resource "alicloud_security_group_rule" "ingress" {
  for_each          = { for r in local.ingress_rules_flat : r.key => r }
  type              = "ingress"
  ip_protocol       = each.value.ip_protocol
  port_range        = each.value.port_range
  security_group_id = alicloud_security_group.security_group.id
  cidr_ip           = each.value.cidr_ip
}