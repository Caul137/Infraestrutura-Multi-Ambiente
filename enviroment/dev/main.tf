module "vpc" {
  source          = "../../modules/vpc"
  env_name        =  "dev"
  vpc_cidr        =  "10.0.0.0/16"
  azs             = ["us-east-1a", "us-east-1b"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
}

module "ec2" {
  source = "../../modules/ec2"
  env_name = "dev"
  instance_type = t3.micro
  subnet_id = module.ec2.public_subnets[0]

}

module "alb" {
  source   = "../../modules/alb"
  env_name = "dev"
  vpc_id   = module.alb.vpc_id
  subnets = module.alb.public_subnets
  instance_id = modulue.ec2.id
}