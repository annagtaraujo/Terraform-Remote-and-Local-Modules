module "ec2_prod_a"{

  source = "../modules/ec2"

  name_instance = format("%s-vpc_a_prod_1", var.infra_name)
  subnet_id                   = module.vpc_a.public_subnets[1]
  #vpc_security_group_ids     = [module.vpc_a.default_security_group_id]
  private_ip                  = "10.10.12.10"
  key_name                    = var.key_name
  security_group_ids = [aws_security_group.default_ec2_a.id]

  depends_on = [
    module.vpc_a
  ]
}

module "ec2_prod_b"{

  source = "../modules/ec2"

  name_instance = format("%s-vpc_b_prod_1", var.infra_name)
  subnet_id                   = module.vpc_b.public_subnets[1]
  #vpc_security_group_ids     = [module.vpc_b.default_security_group_id]
  private_ip                  = "10.20.12.10"
  key_name                    = var.key_name
  security_group_ids = [aws_security_group.default_ec2_b.id]

  depends_on = [
    module.vpc_b
  ]
}

module "ec2_prod_c"{

  source = "../modules/ec2"

  name_instance = format("%s-vpc_c_prod_1", var.infra_name)
  subnet_id                   = module.vpc_c.public_subnets[1]
  #vpc_security_group_ids     = [module.vpc_c.default_security_group_id]
  private_ip                  = "10.30.12.10"
  key_name                    = var.key_name
  security_group_ids = [aws_security_group.default_ec2_c.id]

  depends_on = [
    module.vpc_c
  ]
}
############################################################################

#Security Group

resource "aws_security_group" "default_ec2_a" {
  name        = "teste-default"
  description = "Allow all traffic"
  vpc_id = module.vpc_a.vpc_id

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    Name = "teste-default"
    #scenario = "${var.scenario}"
  }
}

resource "aws_security_group" "default_ec2_b" {
  name        = "teste-default"
  description = "Allow all traffic"
  vpc_id = module.vpc_b.vpc_id

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    Name = "teste-default"
    #scenario = "${var.scenario}"
  }
}

resource "aws_security_group" "default_ec2_c" {
  name        = "teste-default"
  description = "Allow all traffic"
  vpc_id = module.vpc_c.vpc_id

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    Name = "teste-default"
    #scenario = "${var.scenario}"
  }
}