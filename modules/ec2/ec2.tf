resource "aws_instance" "ec2" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.ingress-keypair.key_name
  subnet_id                   = var.subnet_id
  private_ip                  = var.private_ip
  security_groups             = var.vpc_security_group_ids
  
  tags = merge(
    {
      "Name" = format("%s", var.name_instance)
    },
    var.tags
  )
}
#########################################################################

#Key Pair

resource "aws_key_pair" "ingress-keypair" {
  key_name   = "anna-lab"
  public_key = var.public_key

  tags = {
      Name = format("%s-public-key", var.infra_name)
  }
}
