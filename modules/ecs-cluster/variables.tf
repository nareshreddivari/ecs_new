# Common naming prefix for all resources created by this module
variable "name_prefix" {
  description = "Prefix to be used for resource names"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where ECS cluster will be created"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the ECS tasks"
  type        = list(string)
}

variable "tags" {
  description = "Additional tags for resources"
  type        = map(string)
  default     = {}
}

variable "enable_container_insights" {
  description = "Enable CloudWatch Container Insights for the cluster"
  type        = bool
  default     = true
}

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

variable "capacity_providers" {
  description = "List of capacity providers to use with the cluster"
  type        = list(string)
  default     = ["FARGATE", "FARGATE_SPOT"]
}

# New variables added to avoid errors
variable "default_capacity_provider" {
  description = "Default capacity provider for the ECS cluster"
  type        = string
  default     = "FARGATE"
}

variable "default_capacity_provider_base" {
  description = "Base configuration for the default capacity provider"
  type        = number
  default     = 1
}

variable "default_capacity_provider_weight" {
  description = "Weight for the default capacity provider"
  type        = number
  default     = 1
}

# Declare secrets_arn variable in ecs-cluster module
variable "secrets_arn" {
  description = "The ARN of the secrets in AWS Secrets Manager"
  type        = string
}

# Variable for ECS container image
variable "container_image" {
  description = "The container image to use for the ECS service"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs to attach to ECS service"
  type        = list(string)
  default     = []
}
