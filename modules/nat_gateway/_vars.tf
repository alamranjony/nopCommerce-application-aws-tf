variable "vpc_id" {
  type        = string
  description = "VPC ID for creating NAT Gateway and route tables"
}
variable "public_subnet_ids" {
  type        = list(string)
  description = "List of public subnet IDs to place NAT Gateways"
}
variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs to route through NAT Gateways"
}
variable "default_tags" {
  type        = map(string)
  description = "Common tags to apply to all resources"
}
