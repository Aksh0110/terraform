variable "cidr_block" {
  description = "cidr block of vpc "
  type        = string
  default     = "192.100.0.0/16"
}

variable "cidr_blocks" {
  description = "cidr block security group"
  type        = string
  default     = "0.0.0.0/0"
}

variable "vpc_id" {
  description = "vpc id"
  type        = string
  default     = "0.0.0.0/0"
}

