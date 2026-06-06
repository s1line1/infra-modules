output "subnet_ids" {
  value = { for k, v in aws_subnet.subnet : k => v.id }
}

output "subnet_names" {
  value = { for k, v in aws_subnet.subnet : k => v.tags["Name"] }
}

