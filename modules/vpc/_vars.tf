variable "vpc_name" {
  type        = string
  description = "The base name for the VPC"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks for public subnets"
  default     = ["10.0.0.0/20", "10.0.16.0/20"]
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks for private subnets"
  default     = ["10.0.128.0/20", "10.0.144.0/20"]
}

variable "default_tags" {
  type        = map(string)
  description = "Common tags to apply to all resources"
}