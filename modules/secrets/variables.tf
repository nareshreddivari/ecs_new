variable "name_prefix" {
  description = "Prefix to be used for resource names"
  type        = string
}

variable "tags" {
  description = "Additional tags for resources"
  type        = map(string)
  default     = {}
}

variable "secret_values" {
  description = "Map of secret key/value pairs to store in Secrets Manager"
  type        = map(string)
  sensitive   = true
}