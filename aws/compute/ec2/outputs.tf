output "instance_id" {
  value = {for k, r in aws_instance.ec2_instance : k => r.id}
}


output "instance_public_ip" {
  value = {for k, r in aws_instance.ec2_instance : k => r.public_ip}
}