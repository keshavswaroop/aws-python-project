resource "aws_secretsmanager_secret" "app_secret" {
  name = "prod/app/secret-key"
}

resource "aws_secretsmanager_secret_version" "app_secret_value" {
  secret_id     = aws_secretsmanager_secret.app_secret.id
  secret_string = jsonencode({
    APP_SECRET_KEY = "super-secret-value-123"
  })
}
