module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.env_name 
  cidr = "10.0.0.0/16"

  azs             = var.azs
  private_subnets = var.public_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = true
  enable_vpn_gateway = true

 
}
