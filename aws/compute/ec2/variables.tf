variable "ami_id" {
  description = "The ID of the AMI to use for the EC2 instance."
  type        = string
}

variable "instance_type" {
  description = "The type of the EC2 instance (e.g., t2.micro)."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to launch the EC2 instance in."
  type        = string
}

variable "instance_name" {
  description = "The name of the EC2 instance."
  type        = string
}

variable "instance_count" {
  description = "The number of EC2 instances to create."
  type        = number
  default     = 1
}

variable "user_data" {
  description = "The user data to provide when launching the EC2 instance."
  type        = string
}

variable "vpc_security_group_ids" {
  description = "The IDs of the security groups to associate with the EC2 instance."
  type        = list(string)
}


variable "root_block_device" {
  description = "The root block device configuration for the EC2 instance."
  type        = any
  default     = {}
}

# key name
variable "key_name" {
    description = "Key name for ECS instances"
    type        = string
}