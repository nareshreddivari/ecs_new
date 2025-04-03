# AWS Secrets Manager resources

resource "aws_secretsmanager_secret" "app_secrets" {
  name        = "${var.name_prefix}-app-secrets"
  description = "Application secrets for ${var.name_prefix}"

  # Merge provided tags with additional tags if needed (to avoid duplication with default tags)
  tags = merge(var.tags, {
    "ManagedBy" = "terraform"
  })
}

resource "aws_secretsmanager_secret_version" "app_secrets" {
  secret_id     = aws_secretsmanager_secret.app_secrets.id
  secret_string = jsonencode(var.secret_values)
}
