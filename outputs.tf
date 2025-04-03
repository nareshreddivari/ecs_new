output "cluster_arn" {
  description = "ARN of the ECS cluster"
  value       = module.ecs_cluster.cluster_arn
}

output "cluster_name" {
  description = "Name of the ECS cluster"
  value       = module.ecs_cluster.cluster_name
}

output "cluster_capacity_providers" {
  description = "List of capacity providers associated with the ECS cluster"
  value       = module.ecs_cluster.capacity_providers
}
