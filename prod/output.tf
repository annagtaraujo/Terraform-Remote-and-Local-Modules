
##Outputs VPC A

output "vpc_id_a"{
    value = module.vpc_a.vpc_id
}

output "public_subnet_ids_a"{
    value = module.vpc_a.public_subnets
}

output "cidr_block_a"{
    value = module.vpc_a.vpc_cidr_block
}

output "public_route_table_ids_a" {
  value       = module.vpc_a.public_route_table_ids
}

output "private_route_table_ids_a" {
    value = module.vpc_a.private_route_table_ids
}
###############################################################################

##Outputs VPC B

output "vpc_id_b"{
    value = module.vpc_b.vpc_id
}

output "public_subnet_ids_b"{
    value = module.vpc_b.public_subnets
}

output "cidr_block_b"{
    value = module.vpc_b.vpc_cidr_block
}

output "public_route_table_ids_b" {
  value       = module.vpc_b.public_route_table_ids
}

output "private_route_table_ids_b" {
    value = module.vpc_b.private_route_table_ids
}
###############################################################################

##Outputs VPC C

output "vpc_id_c"{
    value = module.vpc_c.vpc_id
}

output "public_subnet_ids_c"{
    value = module.vpc_c.public_subnets
}

output "cidr_block_c"{
    value = module.vpc_c.vpc_cidr_block
}

output "public_route_table_ids_c" {
  value       = module.vpc_c.public_route_table_ids
}

output "private_route_table_ids_c" {
    value = module.vpc_c.private_route_table_ids
}
