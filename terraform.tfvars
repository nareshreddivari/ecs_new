aws_region = "ap-south-1"

environment = "dev"

project_name = "ecs-cluster"

vpc_id = "vpc-02b1eebabe35d884e"

subnet_ids = [
  "subnet-025cf6568ead07c2c"
]

tags = {
  Environment = "dev"
  Project     = "ecs-cluster"
}

secret_values  = {
  "API_KEY" = "your-api-key-here"
  "DB_PASS" = "your-database-password-here"
}

secrets_arn = "arn:aws:secretsmanager:ap-south-1:890742597091:secret:MyTestSecret-AHJI8E"
default_capacity_provider = "FARGATE"
default_capacity_provider_base = 1
default_capacity_provider_weight = 1
# In terraform.tfvars or directly in your root module
container_image = "123456789012.dkr.ecr.ap-south-1.amazonaws.com/my-repo:latest"
#security_group_ids = ["sg-xxxxxxxx", "sg-yyyyyyyy"]

security_group_ids = [
  "sg-0c736f0fe7463f71b", # my-web-app-alb-sg
  "sg-034f56c91535b6627", # launch-wizard-3
  "sg-09463e9690c0578a7", # launch-wizard-2
  "sg-0ba31f3ccf54fd53d", # my-web-app-ecs-tasks-sg
  "sg-080302773bf97c2a0", # default

]



