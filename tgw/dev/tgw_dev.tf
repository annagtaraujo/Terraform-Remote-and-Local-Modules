# TGW Publico tgw.tf

resource "aws_ec2_transit_gateway" "tgw" {
  auto_accept_shared_attachments = "enable"

  # Private Autonomous System Number (ASN) for the Amazon side of a BGP session. The range is 64512 to 65534 for 16-bit ASNs and 4200000000 to 4294967294 for 32-bit ASNs. Default value: 64512
  amazon_side_asn = "64512"

  # VPN Equal Cost Multipath Protocol
  vpn_ecmp_support                = "enable"
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"
  dns_support                     = "enable"

  tags = {
    Name = format("%s-Transit-Gateway-Dev", var.infra_name)
  }

}
