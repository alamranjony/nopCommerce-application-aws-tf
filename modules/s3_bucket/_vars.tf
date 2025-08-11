variable "bucket_name" {
  type        = string
  description = "Name of the S3 bucket for static assets"
}
variable "default_tags" {
  type        = map(string)
  description = "Common tags to apply to all resources"
}
