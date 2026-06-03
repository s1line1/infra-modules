variable "region" {
  description = "Alibaba Cloud region"
  type        = string
  default     = "cn-shanghai"
}

variable "access_key" {
  description = "Alibaba Cloud AccessKey ID"
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "Alibaba Cloud AccessKey Secret"
  type        = string
  sensitive   = true
}