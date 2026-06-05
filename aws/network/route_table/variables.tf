variable "igw_id" {
  description = "The ID of the Internet Gateway to which the route table will be associated."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC in which to create the route table."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to associate with the route table."
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC, used for tagging resources."
  type        = string
}