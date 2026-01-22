resource "aws_s3_bucket" "alb_logs" {
  bucket = "${var.env_name}-alb-logs-${random_id.suffix.hex}"
}

resource "random_id" "suffix" {
  byte_length = 4
}

data "aws_elb_service_account" "this" {}

resource "aws_s3_bucket_policy" "alb_logs" {
  bucket = aws_s3_bucket.alb_logs.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        AWS = data.aws_elb_service_account.this.arn
      }
      Action   = "s3:PutObject"
      Resource = "${aws_s3_bucket.alb_logs.arn}/*"
    }]
  })
}