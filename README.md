# Modular ECS Infrastructure

This Terraform configuration creates an ECS (Elastic Container Service) infrastructure using a modular approach.

## Modules

### ECS Cluster Module (`./modules/ecs-cluster`)
Main module that creates the ECS cluster and coordinates other modules.

### IAM Module (`./modules/iam`)
Handles all IAM-related resources including:
- ECS task execution role
- Required policy attachments

### Capacity Providers Module (`./modules/capacity-providers`)
Manages ECS cluster capacity providers:
- Configures Fargate and Fargate Spot providers
- Sets up default capacity provider strategy

## Usage

```hcl
module "ecs_cluster" {
  source = "./modules/ecs-cluster"

  name_prefix = "${var.project_name}-${var.environment}"
  vpc_id      = var.vpc_id
  subnet_ids  = var.subnet_ids
  
  # Optional capacity provider configurations
  capacity_providers              = ["FARGATE", "FARGATE_SPOT"]
  default_capacity_provider       = "FARGATE"
  default_capacity_provider_base  = 1
  default_capacity_provider_weight = 100

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}
```

## Benefits of This Modular Approach

1. **Separation of Concerns**: Each module handles a specific aspect of the infrastructure
2. **Reusability**: Modules can be reused across different projects
3. **Maintainability**: Easier to update and maintain individual components
4. **Flexibility**: Easy to customize each component without affecting others
5. **Testing**: Modules can be tested independently