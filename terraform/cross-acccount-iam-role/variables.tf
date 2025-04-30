variable "account_id" {
  description = "The AWS account ID where the IAM role will be created."
  type        = string
    default     = "257985830337" # Replace with your actual account ID

}

variable "role_name" {
  description = "The name of the IAM role to be created."
  type        = string
}