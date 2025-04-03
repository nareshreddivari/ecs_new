output "secret_arn" {
  description = "ARN of the created secret"
  value       = aws_secretsmanager_secret.app_secrets.arn
}