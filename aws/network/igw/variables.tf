variable "vpc_id" {
  description = "The ID of the VPC to which the Internet Gateway will be attached."
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC, used for tagging resources."
  type        = string
}