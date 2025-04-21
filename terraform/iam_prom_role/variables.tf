
# Veradigm 
# Author:  Jorge Castaneda
# Date:  2025-02-26
# Description:  Variables for the terraform code

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "account_id" {
  description = "AWS account ID"
  type        = string
  default     = "810212424709"
}

variable "oidc_id" {
  description = "OIDC ID"
  type        = string
  default     = "A0291F3D18AB8F21B85B98C0E6A2371A"
}

variable "namespace" {
  description = "Kubernetes namespace"
  type        = string
  default     = "prometheus"
}

variable "service_account_name" {
  description = "Kubernetes service account name"
  type        = string
  default     = "hub-ue1-sre-prometheus-ope-prometheus"
}

variable "tags" {
  description = "Tags for the resources"
  type        = map(string)
  default = {
    Owner   = "SRE"
    service = "Prometheus"
  }
}
