module "vpc_b" {
  source = "terraform-aws-modules/vpc/aws"

  name = format("%s-vpc-b", var.infra_name)
  cidr = "10.20.0.0/16"

  azs = ["us-west-2a", "us-west-2b"] #, "us-west-2c", "us-west-2d"]

  public_subnets       = ["10.20.11.0/24", "10.20.12.0/24"] #, "10.20.13.0/24", "10.20.14.0/24"]
  public_subnet_suffix = "subnet-pb"

  private_subnets       = ["10.20.21.0/24", "10.20.22.0/24"] #, "10.20.23.0/24", "10.20.24.0/24"]
  private_subnet_suffix = "subnet-pv"

  database_subnets       = ["10.20.31.0/24", "10.20.32.0/24"] #, "10.20.33.0/24", "10.20.34.0/24"]
  database_subnet_suffix = "subnet-db"

  create_igw             = true
  enable_nat_gateway     = true
  one_nat_gateway_per_az = true
  #enable_vpn_gateway     = true
  enable_dns_hostnames = true

## Para usar esse aqui, preciso mudar no módulo principal tudo que for security group default, pois não quero usá-lo
  # manage_security_group  = true
  # security_group_ingress = [
  #   {cidr_block = "0.0.0.0/0",from_port = 22, to_port = 22, protocol = "SSH"},
  #   {cidr_block = "0.0.0.0/0",from_port = 80, to_port = 80, protocol = "TCP"}, 
  #   {cidr_block = "0.0.0.0/0",from_port = 443, to_port = 443, protocol = "TCP"},
  #   {cidr_block = "0.0.0.0/0",from_port = 0, to_port = 0, protocol = "ICMP"}]
  # security_group_egress  = [{cidr_block = "0.0.0.0/0",from_port = 0, to_port = 0}]
  # security_group_name = "VPC-B-SG"
  # security_group_tags = {
  #   Name = "VPC-B-SG"
  #   }

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
