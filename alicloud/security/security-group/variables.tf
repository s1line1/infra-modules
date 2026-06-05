variable "security_group_name" {}
variable "vpc_id" {}

variable "security_group_rules" {
  description = "Security group rules"
  type = map(object({
    port_range  = string
    ip_protocol = string
    cidr_blocks = list(string)
    type        = string
  }))
  # default = {
  #   ssh = {
  #     type        = "ingress"
  #     port_range  = "22/22"
  #     ip_protocol = "tcp"
  #     cidr_blocks = ["0.0.0.0/0"]
  #   }
  #   springboot-demo = {
  #     type        = "ingress"
  #     port_range  = "8083/8083"
  #     ip_protocol = "tcp"
  #     cidr_blocks = ["0.0.0.0/0"]
  #   }
  # }
}