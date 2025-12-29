module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.env_name 
  cidr = var.vpc_cidr

  azs             = var.azs
  private_subnets = var.public_subnets
  public_subnets  = var.public_subnets

}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}