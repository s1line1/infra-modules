output "instance_id" {
    value = alicloud_instance.this[*].id
    # value = { for k, r in alicloud_instance.this : k => r.id }
}