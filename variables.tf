# AWS region where the infrastructure will be deployed
variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "ap-south-1"
}

variable "environment" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "ecs-cluster"
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

variable "secret_values" {
  description = "Map of secret key/value pairs to store in AWS Secrets Manager"
  type        = map(string)
  sensitive   = true
}

variable "secrets_arn" {
  description = "ARN of the secret in AWS Secrets Manager"
  type        = string
}

# Add the ECS capacity provider-related variables
variable "capacity_providers" {
  description = "List of capacity providers to use with the ECS cluster"
  type        = list(string)
  default     = ["FARGATE", "FARGATE_SPOT"]
}

variable "default_capacity_provider" {
  description = "Default capacity provider for the ECS cluster"
  type        = string
}

variable "default_capacity_provider_base" {
  description = "Default capacity provider base for the ECS cluster"
  type        = number
}

variable "default_capacity_provider_weight" {
  description = "Weight for the default capacity provider"
  type        = number
}

# Declare the container_image variable in the root module
variable "container_image" {
  description = "The container image to use for the ECS service"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
}