# The ARN (Amazon Resource Name) of the created ECS cluster
# This can be used by other resources to reference the cluster
output "cluster_arn" {
  description = "ARN of the ECS cluster"
  value       = aws_ecs_cluster.main.arn
}

output "cluster_name" {
  description = "Name of the ECS cluster"
  value       = aws_ecs_cluster.main.name
}

output "capacity_providers" {
  value = var.capacity_providers
}


output "task_execution_role_arn" {
  description = "ARN of the ECS task execution role"
  value       = module.iam.task_execution_role_arn
}