resource "aws_secretsmanager_secret" "app_secret" {
  name = "app-${var.env_name}-api-password"
}

resource "aws_secretsmanager_secret_version" "app_secret_value" {
  secret_id     = aws_secretsmanager_secret.app_secret.id
  secret_string = jsonencode({
    API_PASSWORD = var.secret_password
  })
}

output "secret_arn" {
  value = aws_secretsmanager_secret.app_secret.arn
}
