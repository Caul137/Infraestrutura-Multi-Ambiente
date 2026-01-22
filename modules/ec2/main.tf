resource "aws_iam_role" "ec2_role" {
  name = "${var.env_name}-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "ec2.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${var.env_name}-ec2-profile"
  role = aws_iam_role.ec2_role.name
}

resource "aws_iam_role_policy" "secrets_policy" {
  role = aws_iam_role.ec2_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = ["secretsmanager:GetSecretValue"]
      Resource = var.secret_arn
    },{
       Effect   = "Allow"
       Action   = ["kms:Decrypt"]
       Resource = aws_kms_key.secrets_key.arn
    }]
  })
}


data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}


module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "${var.env_name}-app"

  ami = data.aws_ami.amazon_linux.id

  instance_type = var.instance_type

  subnet_id     = var.subnet_id

  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  tags = {
    Terraform   = "true"
  }
}

output "instance_id" {
  value = module.ec2_instance.id
}