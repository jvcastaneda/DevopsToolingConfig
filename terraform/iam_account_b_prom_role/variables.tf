
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
  default     = "257985830337"
}

variable "oidc_id" {
  description = "OIDC ID"
  type        = string
  default     = "AD6603A1A8E57DBB1DB804ECDB81BA09"
}

variable "namespace" {
  description = "Kubernetes namespace"
  type        = string
  default     = "prometheus"
}

variable "service_account_name" {
  description = "Kubernetes service account name"
  type        = string
  default     = "kube-prometheus-stack-prometheus"
}

variable "tags" {
  description = "Tags for the resources"
  type        = map(string)
  default = {
    Owner   = "SRE"
    Service = "Prometheus"
  }
}
