variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "The name tag for the VPC"
  default     = "KCVPC"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  default     = "10.0.2.0/24"
}

variable "availability_zone" {
  description = "The availability zone for the subnets"
  default     = "us-east-1a"  
}

variable "public_key_path" {
  description = "Path to the public key for SSH access"
  type        = string
  default     = "/home/mabirhire/my_keys/aws/aws_keys.pub"  
}

variable "local_ip" {
  description = "The local IP address for SSH access"
  type        = string
}
