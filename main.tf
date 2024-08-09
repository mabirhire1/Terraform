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

module "vpc" {
  source     = "./modules/vpc"

  vpc_cidr   = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"
}















