# Define Terraform provider
terraform {
  required_version = "~> 1.9.8"

  required_providers {
    aws = {
      version = "~> 5.81.0"
      source  = "hashicorp/aws"
    }
  }
}

# Download AWS provider
provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      CodeAt    = "https://github.com/BillrMd/tf-observability-iam"
      Terraform = true
    }
  }
}

data "aws_region" "current" {}