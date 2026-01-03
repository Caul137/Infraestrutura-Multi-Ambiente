resource "aws_kms_key" "secrets_key" {
  description             = "KMS key ${var.env_name} "
  deletion_window_in_days = 7
}
