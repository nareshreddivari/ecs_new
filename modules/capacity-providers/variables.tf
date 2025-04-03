variable "environment" {
  description = "Environment name for tagging"
  type        = string
}

variable "project_name" {
  description = "Project name for tagging"
  type        = string
}

variable "cost_center" {
  description = "Cost center for billing tracking"
  type        = string
  default     = "undefined"
}

variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "capacity_providers" {
  description = "List of capacity providers to use"
  type        = list(string)
  default     = ["FARGATE", "FARGATE_SPOT"]
}

variable "default_capacity_provider_base" {
  description = "Base number of tasks to run on the default capacity provider"
  type        = number
  default     = 1
}

variable "default_capacity_provider_weight" {
  description = "Relative weight of the default capacity provider"
  type        = number
  default     = 100
}

variable "default_capacity_provider" {
  description = "Default capacity provider to use"
  type        = string
  default     = "FARGATE"
}