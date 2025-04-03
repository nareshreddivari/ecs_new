resource "aws_ecs_cluster_capacity_providers" "main" {
  cluster_name = var.cluster_name

  capacity_providers = var.capacity_providers

  default_capacity_provider_strategy {
    base              = var.default_capacity_provider_base
    weight            = var.default_capacity_provider_weight
    capacity_provider = var.default_capacity_provider
  }
}
