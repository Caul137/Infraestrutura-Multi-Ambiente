variable "env_name" {}

variable "instance_type" {}

variable "subnet_id" {}

variable "secret_arn" {}

variable "vpc_id" {}

variable "secret_password" {
  type      = string
  sensitive = true
}
