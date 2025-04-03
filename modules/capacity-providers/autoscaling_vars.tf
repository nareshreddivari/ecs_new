variable "service_name" {
  description = "Name of the ECS service"
  type        = string
}

variable "min_capacity" {
  description = "Minimum number of tasks"
  type        = number
  default     = 1
}

variable "max_capacity" {
  description = "Maximum number of tasks"
  type        = number
  default     = 10
}

variable "target_cpu_utilization" {
  description = "Target CPU utilization percentage"
  type        = number
  default     = 70
}

variable "target_memory_utilization" {
  description = "Target memory utilization percentage"
  type        = number
  default     = 70
}

variable "scale_in_cooldown" {
  description = "Time in seconds before allowing another scale in activity"
  type        = number
  default     = 300
}

variable "scale_out_cooldown" {
  description = "Time in seconds before allowing another scale out activity"
  type        = number
  default     = 300
}