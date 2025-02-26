# Veradigm 
# Author:  Jorge Castaneda
# Date:  2025-02-26
# Description:  Variables for the terraform code

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-west-1"
}

variable "account_id" {
  description = "AWS account ID"
  type        = string
  default = "257985830337"
}

variable "oidc_id" {
  description = "OIDC ID"
  type        = string
  default = "D667600E017DEC8E3B6B0BF88FE5343F"
}

variable "namespace" {
  description = "Kubernetes namespace"
  type        = string
  default = "default"
}

variable "service_account_name" {
  description = "Kubernetes service account name"
  type        = string
  default = "yace-prometheus-yet-another-cloudwatch-exporter"
}

variable "tags" {
  description = "Tags for the resources"
  type        = map(string)
  default     = {
    Environment = "INT"
    Owner       = "SRE"
  }
}