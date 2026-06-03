output "security_group_id" {
    description = "The ID of the security group."
    value       = alicloud_security_group.security_group.id
}