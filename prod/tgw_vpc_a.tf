#VPC Attachment

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_attach_vpc_a" {
  subnet_ids = module.vpc_a.public_subnets
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id = module.vpc_a.vpc_id
  tags = {
    Name = "Transit Gateway VPC A Attachment - Public Traffic"
  }
  transit_gateway_default_route_table_association = "false"
  transit_gateway_default_route_table_propagation = "false"

  depends_on = [aws_ec2_transit_gateway.tgw]

}
#############################################################################

#Route Table

resource "aws_ec2_transit_gateway_route_table" "tgw_rt_a" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  tags               = {
    Name             = "Route-Table-TGW-A"
  }
  depends_on = [aws_ec2_transit_gateway.tgw]
}
###############################################################################

#TGW RT Association

resource "aws_ec2_transit_gateway_route_table_association" "tgw_rt_a_vpc_a_assoc" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw_attach_vpc_a.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_a.id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.tgw_attach_vpc_a]
}
###############################################################################

#TGW RT Propagation

resource "aws_ec2_transit_gateway_route_table_propagation" "tgw_rt_b_pb_to_vpc_a" {              #A falará com B
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw_attach_vpc_a.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_b.id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.tgw_attach_vpc_a, aws_ec2_transit_gateway_route_table_association.tgw_rt_a_vpc_a_assoc]
}
###############################################################################

#Routes

resource "aws_route" "private_a_to_b" {
  for_each = toset(module.vpc_a.private_route_table_ids)
  route_table_id         = each.value
  destination_cidr_block = module.vpc_b.vpc_cidr_block
  transit_gateway_id           = aws_ec2_transit_gateway.tgw.id

  timeouts {
    create = "5m"
  }

  depends_on = [
    aws_ec2_transit_gateway.tgw,
    aws_ec2_transit_gateway_vpc_attachment.tgw_attach_vpc_a
  ]
}

resource "aws_route" "public_a_to_b" {
  for_each = toset(module.vpc_a.public_route_table_ids)
  route_table_id         = each.value
  destination_cidr_block = module.vpc_b.vpc_cidr_block
  transit_gateway_id           = aws_ec2_transit_gateway.tgw.id

  timeouts {
    create = "5m"
  }

  depends_on = [
    aws_ec2_transit_gateway.tgw,
    aws_ec2_transit_gateway_vpc_attachment.tgw_attach_vpc_a
  ]
}

resource "aws_route" "private_a_to_c" {
  for_each = toset(module.vpc_a.private_route_table_ids)
  route_table_id         = each.value
  destination_cidr_block = module.vpc_c.vpc_cidr_block
  transit_gateway_id           = aws_ec2_transit_gateway.tgw.id

  timeouts {
    create = "5m"
  }

  depends_on = [
    aws_ec2_transit_gateway.tgw,
    aws_ec2_transit_gateway_vpc_attachment.tgw_attach_vpc_a
  ]
}

resource "aws_route" "public_a_to_c" {
  for_each = toset(module.vpc_a.public_route_table_ids)
  route_table_id         = each.value
  destination_cidr_block = module.vpc_c.vpc_cidr_block
  transit_gateway_id           = aws_ec2_transit_gateway.tgw.id

  timeouts {
    create = "5m"
  }

  depends_on = [
    aws_ec2_transit_gateway.tgw,
    aws_ec2_transit_gateway_vpc_attachment.tgw_attach_vpc_a
  ]
}