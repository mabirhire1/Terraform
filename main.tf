terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.61.0"
    }
  }
}

provider "aws" {
  region = "us-east-1
}

data "http" "myip" {
  url = "https://ifconfig.me"
}

locals {
  local_ip = chomp(data.http.myip.response_body)
}

resource "aws_key_pair" "angel" {
   key_name   = "angel"
   public_key = file("~/.ssh/angel.pub")
}

module "vpc" {
  source     = "./modules/vpc"

  vpc_cidr   = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"
}

module "ec2_instances" {
  source                    = "./modules/ec2_instances"
  public_subnet_id          = var.public_subnet_id
  private_subnet_id         = var.private_subnet_id
  public_security_group_id  = var.security_groups.public_sg_id
  private_security_group_id = var.security_groups.private_sg_id
  public_key_path           = var.public_key_path
}














