variable "vpc_id" {
  type        = string
  description = "VPC ID for RDS"
}
variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs for RDS"
}
variable "app_security_group_id" {
  type        = string
  description = "Security Group ID of application servers to allow access"
}
variable "db_instance_class" {
  type        = string
  description = "DB instance class for RDS"
  default     = "db.t3.medium"
}
variable "db_allocated_storage" {
  type        = number
  description = "Allocated storage (GB) for RDS"
  default     = 20
}
variable "db_username" {
  type        = string
  description = "Master DB username"
  default     = "admin"
}
variable "default_tags" {
  type        = map(string)
  description = "Common tags to apply to all resources"
}
