module "ec2_dev"{
  source = "../modules/ec2"

  name_instance = format("%s-vpc_a_dev_1", var.infra_name)
  subnet_id                   = module.vpc_a.public_subnets[1]
  #vpc_security_group_ids     = module.vpc_a.security_group_id
  private_ip                  = "10.10.12.10"

  depends_on = [
    module.vpc_a
  ]
}
