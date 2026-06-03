variable "vpc_name" {
  description = "Name of the test VPC"
  type        = string
  default     = "demo-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for the test VPC"
  type        = string
}