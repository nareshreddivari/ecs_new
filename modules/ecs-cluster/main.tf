# Create an Amazon ECS (Elastic Container Service) cluster
resource "aws_ecs_cluster" "main" {
  name = "${var.name_prefix}-cluster"

  setting {
    name  = "containerInsights"
    value = var.enable_container_insights ? "enabled" : "disabled"
  }

  tags = merge(var.tags, {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "terraform"
    CostCenter  = var.cost_center
  })
}

# Declare ECS Task Definition
resource "aws_ecs_task_definition" "main" {
  family                = "${var.name_prefix}-task-def"
  execution_role_arn    = module.iam.task_execution_role_arn
  task_role_arn         = module.iam.task_execution_role_arn
  network_mode          = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                   = "256"
  memory                = "512"

  container_definitions = jsonencode([{
    name      = "${var.name_prefix}-container"
    image     = var.container_image
    essential = true
    memory    = 512
    cpu       = 256
  }])
}

# Define the ECS service
resource "aws_ecs_service" "main" {
  name            = "${var.name_prefix}-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.main.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.subnet_ids
    security_groups = var.security_group_ids
    assign_public_ip = true
  }

  # Merge tags from input and default tags
  tags = merge(var.tags, {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "terraform"
    CostCenter  = var.cost_center
  })
}

# Import capacity providers module for ECS cluster configuration
module "capacity_providers" {
  source = "../capacity-providers"

  cluster_name = aws_ecs_cluster.main.name
  service_name = aws_ecs_service.main.name  # Pass ECS service name
  capacity_providers              = var.capacity_providers
  default_capacity_provider       = var.default_capacity_provider
  default_capacity_provider_base  = var.default_capacity_provider_base
  default_capacity_provider_weight = var.default_capacity_provider_weight

  environment  = var.environment
  project_name = var.project_name
  cost_center  = var.cost_center
}
