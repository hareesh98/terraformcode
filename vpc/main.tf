data "aws_availability_zones" "example" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

resource "aws_vpc" "mainvpc" {
  cidr_block = var.vpc_cidr_addr
  instance_tenancy = var.instance_tenancy
  enable_dns_support = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_classiclink = var.enable_classiclink
  enable_classiclink_dns_support = var.enable_classiclink_dns_support
  assign_generated_ipv6_cidr_block = var.assign_generated_ipv6_cidr_block
  tags = var.vpc_tags
}


resource "aws_subnet" "public" {
  depends_on = [aws_vpc.mainvpc]
  vpc_id     = aws_vpc.mainvpc.id
  count      = length(var.public_subnets)
  cidr_block = var.public_subnets[count.index]
  availability_zone = data.aws_availability_zones.example.names[count.index]
  tags = {
    Name = "${aws_vpc.mainvpc.id}-PublicSubnet-${count.index}"
  }
}

resource "aws_subnet" "private" {
  depends_on = [aws_vpc.mainvpc]
  vpc_id     = aws_vpc.mainvpc.id
  count      = length(var.private_subnets)
  cidr_block = var.private_subnets[count.index]
  availability_zone = data.aws_availability_zones.example.names[count.index]
  tags = {
    Name = "${aws_vpc.mainvpc.id}-PrivateSubnet-${count.index}"
  }
}

resource "aws_route_table" "public" {
  depends_on = [aws_vpc.mainvpc]
  vpc_id = aws_vpc.mainvpc.id
  route = []
  tags = {
    Name = "${aws_vpc.mainvpc.id}-PublicRoute"
  }
}

resource "aws_route_table" "private" {
  depends_on = [aws_vpc.mainvpc]
  vpc_id = aws_vpc.mainvpc.id
  route = []
  tags = {
    Name = "${aws_vpc.mainvpc.id}-PrivateRoute"
  }
}

resource "aws_internet_gateway" "gw" {
  depends_on = [aws_vpc.mainvpc]
  vpc_id = aws_vpc.mainvpc.id
  tags = {
    Name = "${aws_vpc.mainvpc.id}-igw"
  }
}

resource "aws_eip" "eip" {
  vpc      = true
}


resource "aws_nat_gateway" "ngw" {
  depends_on = [aws_internet_gateway.gw, aws_subnet.public]
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public[0].id
  tags = {
    Name = "${aws_vpc.mainvpc.id}-ngw"
  }
}

resource "aws_route_table_association" "pubrt" {
  depends_on  = [aws_subnet.public,aws_route_table.public]
  count = length(var.public_subnets)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "privrt" {
  depends_on  = [aws_subnet.private,aws_route_table.private]
  count = length(var.private_subnets)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}

resource "aws_route" "publicrt" {
  depends_on                = [aws_route_table.public]
  route_table_id            = aws_route_table.public.id
  gateway_id                = aws_internet_gateway.gw.id
  destination_cidr_block    = "0.0.0.0/0"
}

resource "aws_route" "privatert" {
  depends_on                = [aws_route_table.private]
  route_table_id            = aws_route_table.private.id
  nat_gateway_id            = aws_nat_gateway.ngw.id
  destination_cidr_block    = "0.0.0.0/0"
}

resource "aws_security_group" "security_groups" {
  for_each = var.security_groups
  name        = each.value["name"]
  description = each.value["description"]
  depends_on = [aws_vpc.mainvpc]
  vpc_id     = aws_vpc.mainvpc.id
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