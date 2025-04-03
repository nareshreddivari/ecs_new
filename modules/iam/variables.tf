variable "secrets_arn" {
  description = "ARN of the secrets in Secrets Manager that ECS tasks need access to"
  type        = string
}

variable "name_prefix" {
  description = "Prefix to be used for resource names"
  type        = string
}

variable "tags" {
  description = "Additional tags for resources"
  type        = map(string)
  default     = {}
}