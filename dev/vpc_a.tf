module "vpc_a" {
  source = "terraform-aws-modules/vpc/aws"

  name = format("%s-vpc-a", var.infra_name)
  cidr = "10.10.0.0/16"

  azs = ["us-west-2a", "us-west-2b"] #, "us-west-2c", "us-west-2d"]

  public_subnets       = ["10.10.11.0/24", "10.10.12.0/24"] #, "10.10.13.0/24", "10.10.14.0/24"]
  public_subnet_suffix = "subnet-pb"

  private_subnets       = ["10.10.21.0/24", "10.10.22.0/24"] #, "10.10.23.0/24", "10.10.24.0/24"]
  private_subnet_suffix = "subnet-pv"

  database_subnets       = ["10.10.31.0/24", "10.10.32.0/24"] #, "10.10.33.0/24", "10.10.34.0/24"]
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
  # security_group_name = "VPC-A-SG"
  # security_group_tags = {
  #   Name = "VPC-A-SG"
  #   }

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

data "aws_vpc" "default" {
  default = true
}