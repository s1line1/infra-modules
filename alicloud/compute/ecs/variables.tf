# project name
variable "project_name" {
  description = "Project name used for resource naming prefix"
  type        = string
}

variable "image_id" {
  description = "ECS image ID"
  type        = string
  default     = "ubuntu_20_04_x64_20G_alibase_20220318.vhd"
}

# ECS 数量
variable "ecs_count" {
  description = "Number of test ECS instances"
  type        = number
  default     = 1
}

# 实例规格
variable "instance_type" {
  description = "ECS instance type"
  type        = string
  default     = "ecs.e-c1m1.large"
}

# 系统盘规格
variable "system_disk_category" {
    description = "System disk category"
    type        = string
    default     = "cloud_essd_entry"
}

# 硬盘大小规格
variable "system_disk_size" {
    description = "System disk size (GB)"
    type        = number
    default     = 40
}

# key name
variable "key_name" {
    description = "Key name for ECS instances"
    type        = string
    default     = "root"
}

variable "instance_charge_type" {
    description = "Instance charge type"
    type        = string
    default     = "PostPaid"
}

variable "internet_charge_type" {
    description = "Internet charge type"
    type        = string
    default     = "PayByTraffic"
}

variable "internet_max_bandwidth_out" {
    description = "Maximum outbound bandwidth for the internet connection (Mbps)"
    type        = number
    default     = 1
}

variable "vswitch_id" {
  description = "Existing vSwitch ID"
}

variable "security_group_id" {
  description = "Existing security group ID"
}

variable "user_data" {
  description = "User data scripts for ECS instances"
}