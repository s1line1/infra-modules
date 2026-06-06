output "aws_route_table_association_ids" {
  value = { for k, v in aws_route_table_association.rta : k => v.id }
}
