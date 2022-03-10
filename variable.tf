variable "sns_topic_name" {
  description = "SNS Topic Name"
  type        = string
  default     = "pelican-dev-sns-test-1"
}

variable "bucket_name" {
  description = "S3 Bucket Name"
  type        = string
  default     = "pelican-dev-s3-test-1"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to add to resources"
}

variable "aws_region" {
  type        = string
  default     = "us-west-2"
  description = "AWS Region"
}

variable "emails" {
  default     = ["candidate-test@idlemailbox.com"]
  description = "Enter valid emails, that needs to be confirmed for subscription to work"
}
