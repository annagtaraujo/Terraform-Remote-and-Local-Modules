#Esse output é apenas um teste de verificação de outputs do módulo VPC

output "subnet_id_1"{
    value = module.vpc_a.public_subnets[1]
}

output "subnet_block"{
    value = module.vpc_a.public_subnets_cidr_blocks[1]
}
