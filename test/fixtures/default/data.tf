# aws_caller_identity used to generate output variables for the assumed role details
data "aws_caller_identity" "current" {}

# generate a random string to build the session name suffix.
resource "random_id" "session_suffix" {
  byte_length = 8
}

locals {
  region           = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.68.0"
    }
  }
}

provider "aws" {
  region = local.region
}
