
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  for_each = toset(["one", "two", "three"])

  name = "${var.env_name}-app"

  instance_type = var.instance_type
  key_name      = "user1"
  monitoring    = true
  subnet_id     = var.subnet_id

  tags = {
    Terraform   = "true"
    Environment = var.env_name
  }
}
