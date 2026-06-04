variable "vpc_id" {}

variable "security_group_name" {}

variable "ingress_rules" {
  description = "Ingress security group rules"
  type = map(object({
    name        = string
    type        = string
    from_port   = string
    to_port     = string
    ip_protocol = string
    cidr_blocks = list(string)
  }))
}