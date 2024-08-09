output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_id" {
  value = module.subnets.public_subnet_id
}

output "private_subnet_id" {
  value = module.subnets.private_subnet_id
}

output "public_instance_ip" {
  value = module.ec2_instances.public_instance_ip
}

output "private_instance_ip" {
  value = module.ec2_instances.private_instance_ip
}
