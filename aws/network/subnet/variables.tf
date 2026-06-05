variable "vpc_id" {
  description = "The ID of the VPC in which to create the subnet."
  type        = string
}

variable "subnet_cidr" {
  description = "The CIDR block for the subnet."
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet."
  type        = string
}

variable "map_public_ip_on_launch" {
  description = "Whether to automatically assign a public IP address to instances launched in this subnet."
  type        = bool
  default     = false
}