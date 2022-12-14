output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  value = module.vpc.vpc_cidr_block
}

output "private_subnets_ids" {
  value = module.vpc.private_subnets
}

output "private_subnets_cidrs" {
  value = module.vpc.private_subnets_cidr_blocks
}

output "public_subnets_ids" {
  value = module.vpc.public_subnets
}

output "public_subnets_cidrs" {
  value = module.vpc.public_subnets_cidr_blocks
}

output "database_subnets_ids" {
  value = module.vpc.database_subnets
}

output "database_subnets_cidrs" {
  value = module.vpc.database_subnets_cidr_blocks
}

output "database_subnetgroup_name" {
  value = module.vpc.database_subnet_group_name
}

