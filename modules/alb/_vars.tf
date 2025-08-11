variable "name_prefix" {
  type        = string
  description = "Prefix for naming ALB and related resources"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID for the ALB"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of public subnet IDs for ALB"
}

variable "default_tags" {
  type        = map(string)
  description = "Common tags to apply to all resources"
}
