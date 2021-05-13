#Key Pair

resource "aws_key_pair" "keypair" {

  key_name   = var.key_name
  public_key = var.public_key

  tags = {
      Name = format("%s-public-key", var.infra_name)
  }
}
