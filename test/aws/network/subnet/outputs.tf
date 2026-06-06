output "vpc_id" {
    value = module.vpc.vpc_id
}

output "vpc_name" {
    value = module.vpc.vpc_name
}

# output "subnet_ids" {
#     value = module.subnet.subnet_ids
# }

# output "subnet_names" {
#     value = module.subnet.subnet_names
# }

output "subnet_map" {
  value = { for k, v in module.subnet.subnet_ids : k => {
    id   = v
    name = module.subnet.subnet_names[k]
  } }
}