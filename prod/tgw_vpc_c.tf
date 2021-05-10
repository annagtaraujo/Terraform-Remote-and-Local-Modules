#VPC Attachment

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_attach_vpc_c" {
  subnet_ids = module.vpc_c.public_subnets
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id = module.vpc_c.vpc_id
  tags = {
    Name = "Transit Gateway VPC B Attachment - Public Traffic"
  }
  transit_gateway_default_route_table_association = "false"
  transit_gateway_default_route_table_propagation = "false"

  depends_on = [aws_ec2_transit_gateway.tgw]

}
##############################################################################3

#Route Table

resource "aws_ec2_transit_gateway_route_table" "tgw_rt_c" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  tags               = {
    Name             = "Route-Table-TGW-C"
  }
  depends_on = [aws_ec2_transit_gateway.tgw]
}
###############################################################################

#TGW RT Association

resource "aws_ec2_transit_gateway_route_table_association" "tgw_rt_c_vpc_c_assoc" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw_attach_vpc_c.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_c.id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.tgw_attach_vpc_c]
}
###############################################################################

#TGW RT Propagation

resource "aws_ec2_transit_gateway_route_table_propagation" "tgw_rt_a_pb_to_vpc_c" {             #B falará com A
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw_attach_vpc_c.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rt_a.id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.tgw_attach_vpc_b,aws_ec2_transit_gateway_route_table_association.tgw_rt_b_vpc_b_assoc]
}
###############################################################################

#Routes

resource "aws_route" "private_c_to_a" {
  for_each = toset(module.vpc_c.private_route_table_ids)
  route_table_id         = each.value
  destination_cidr_block = module.vpc_a.vpc_cidr_block
  transit_gateway_id           = aws_ec2_transit_gateway.tgw.id

  timeouts {
    create = "5m"
  }

  depends_on = [
    aws_ec2_transit_gateway.tgw,
    aws_ec2_transit_gateway_vpc_attachment.tgw_attach_vpc_c
  ]
}

resource "aws_route" "public_c_to_a" {
  for_each = toset(module.vpc_c.public_route_table_ids)
  route_table_id         = each.value
  destination_cidr_block = module.vpc_a.vpc_cidr_block
  transit_gateway_id           = aws_ec2_transit_gateway.tgw.id

  timeouts {
    create = "5m"
  }

  depends_on = [
    aws_ec2_transit_gateway.tgw,
    aws_ec2_transit_gateway_vpc_attachment.tgw_attach_vpc_c
  ]
}