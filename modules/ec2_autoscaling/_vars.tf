variable "name_prefix" {
  type        = string
  description = "Prefix for naming launch template and Auto Scaling Group resources"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID used to filter private subnets"
}

variable "ami_id" {
  type        = string
  description = "AMI ID to use for EC2 instances"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "key_name" {
  type        = string
  description = "Name of the key pair to use for SSH access"
}

variable "user_data" {
  type        = string
  description = "Base64-encoded user data script to configure EC2 instances"
  default     = ""
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of security group IDs to associate with EC2 instances"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs for Auto Scaling Group placement"
}

variable "desired_capacity" {
  type        = number
  description = "Desired number of EC2 instances in the Auto Scaling Group"
  default     = 1
}

variable "min_size" {
  type        = number
  description = "Minimum number of EC2 instances in the Auto Scaling Group"
  default     = 1
}

variable "max_size" {
  type        = number
  description = "Maximum number of EC2 instances in the Auto Scaling Group"
  default     = 2
}

variable "default_tags" {
  type        = map(string)
  description = "Common tags to apply to all resources"
}