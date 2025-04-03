# Define local variables used throughout the configuration
locals {
  # Create a consistent naming prefix using project name and environment
  name_prefix = "${var.project_name}-${var.environment}"
}

# Create secrets in AWS Secrets Manager
module "secrets" {
  source = "./modules/secrets"

  name_prefix   = local.name_prefix
  secret_values = var.secret_values
  tags          = var.tags
}

# Create an ECS cluster using the ecs-cluster module
# This module sets up a complete ECS environment including the cluster, 
# capacity providers, and necessary IAM roles
module "ecs_cluster" {
  source = "./modules/ecs-cluster"  # Fix: Add the missing closing quote

  container_image   = var.container_image
  name_prefix       = local.name_prefix
  vpc_id            = var.vpc_id
  subnet_ids        = var.subnet_ids
  environment       = var.environment
  project_name      = var.project_name
  secrets_arn       = var.secrets_arn  # Make sure to declare this variable in `ecs-cluster/variables.tf`
  security_group_ids = var.security_group_ids
  tags              = var.tags
}
