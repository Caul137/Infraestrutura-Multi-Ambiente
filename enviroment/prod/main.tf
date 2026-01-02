
module "vpc" {
  source          = "../../modules/vpc"
  env_name        =  "prod"
  vpc_cidr        =  "10.0.0.0/16"
  azs             = ["us-east-1a", "us-east-1b"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
}

module "ec2" {
  source = "../../modules/ec2"
  env_name = "prod"
  instance_type = "t3.medium"
  subnet_id = module.vpc.public_subnets[0]
 secret_arn = "arn:aws:secretsmanager:us-east-1:123:secret:app-prod-api-password"
}

module "alb" {
  source   = "../../modules/alb"
  env_name = "prod"
  vpc_id   = module.alb.vpc_id
  subnets = module.alb.public_subnets
  instance_id = modulue.ec2.instance_id
}