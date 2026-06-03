variable "security_group_name" {}
variable "vpc_id" {}

variable "ingress_rules" {
  description = "Ingress security group rules"
  type = map(object({
    port_range  = string
    ip_protocol = string
    cidr_blocks = list(string)
  }))
#   default = {
#     ssh = {
#       port_range  = "22/22"
#       ip_protocol = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#     }
#     springboot-demo = {
#       port_range  = "8083/8083"
#       ip_protocol = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#     }
#   }
}