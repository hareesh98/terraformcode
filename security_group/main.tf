resource "aws_security_group" "security_groups" {
  for_each = var.security_groups
  name        = each.value["name"]
  description = each.value["description"]
  vpc_id      = var.vpcid
  tags = each.value["tags"]
  dynamic "ingress" {
    for_each = each.value.ingress
    content {
       from_port   = ingress.value.from_port
       to_port     = ingress.value.to_port
       protocol    = ingress.value.protocol
       cidr_blocks  = ingress.value.cidr_blocks
       description = ingress.value.description
       ipv6_cidr_blocks = ingress.value.ipv6_cidr_blocks
       prefix_list_ids =  ingress.value.prefix_list_ids
       security_groups =  ingress.value.security_groups
    }
  }
  dynamic "egress" {
    for_each = each.value.egress
    content {
       from_port   = egress.value.from_port
       to_port     = egress.value.to_port
       protocol    = egress.value.protocol
       cidr_blocks  = egress.value.cidr_blocks
       description = egress.value.description
       ipv6_cidr_blocks = egress.value.ipv6_cidr_blocks
       prefix_list_ids =  egress.value.prefix_list_ids
       security_groups =  egress.value.security_groups
    }
  }
}