# Pass the secrets ARN to the IAM module
module "iam" {
  source = "../iam"

  name_prefix = var.name_prefix
  secrets_arn = var.secrets_arn
  tags        = var.tags
}