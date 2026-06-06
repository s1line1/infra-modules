variable "vpc_id" {
  description = "The ID of the VPC in which to create the subnet."
  type        = string
}

variable "map_public_ip_on_launch" {
  description = "Whether to automatically assign a public IP address to instances launched in this subnet."
  type        = bool
  default     = false
}

variable "public_subnets" {
  description = "A map of public subnets to create, where the key is a unique identifier and the value is an object containing the CIDR block."
  type = map(object({
    cidr = string
    name = string
  }))
}