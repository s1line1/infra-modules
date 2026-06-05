variable "vpc_id" {}

variable "security_group_name" {}

variable "security_group_rules" {
  description = "Security group rules"
  type = map(object({
    name        = string
    type        = string
    from_port   = string
    to_port     = string
    ip_protocol = string
    cidr_blocks = list(string)
  }))
}