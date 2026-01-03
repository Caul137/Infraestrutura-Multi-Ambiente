resource "aws_s3_bucket" "alb_logs" {
  bucket = "${var.env_name}-alb-logs-${random_id.suffix.hex}"
}

resource "random_id" "suffix" {
  byte_length = 4
}
