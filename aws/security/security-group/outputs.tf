output "security_group_id" {
    value = aws_security_group.security_group.id
}

output "ingress_rule_ids" {
    value = { for k, r in aws_security_group_rule.ingress : k => r.id }
}