module "vpc_c" {
  source = "terraform-aws-modules/vpc/aws"

  name = format("%s-vpc-c", var.infra_name)
  cidr = "10.30.0.0/16"

  azs              = ["us-west-2a", "us-west-2b"]#, "us-west-2c", "us-west-2d"]

  public_subnets   = ["10.30.11.0/24", "10.30.12.0/24"]#, "10.30.13.0/24", "10.30.14.0/24"]
  public_subnet_suffix = "subnet-pb"
  
  private_subnets  = ["10.30.21.0/24", "10.30.22.0/24"]#, "10.30.23.0/24", "10.30.24.0/24"]
  private_subnet_suffix = "subnet-pv"
  
  database_subnets = ["10.30.31.0/24", "10.30.32.0/24"]#, "10.30.33.0/24", "10.30.34.0/24"]
  database_subnet_suffix = "subnet-db"

  create_igw            = true
  enable_nat_gateway     = true
  one_nat_gateway_per_az = true
  #enable_vpn_gateway     = true
  enable_dns_hostnames    = true

   tags = {
     Terraform   = "true"
     Environment = "prod"
   }
}
