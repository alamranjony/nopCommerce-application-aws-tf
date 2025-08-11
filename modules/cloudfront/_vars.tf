variable "bucket_name" {
  type        = string
  description = "Name of the S3 bucket to serve via CloudFront"
}
variable "bucket_arn" {
  type        = string
  description = "ARN of the S3 bucket to serve via CloudFront"
}
variable "bucket_regional_domain_name" {
  type        = string
  description = "Regional domain name of the S3 bucket"
}
variable "default_tags" {
  type        = map(string)
  description = "Common tags to apply to all resources"
}
