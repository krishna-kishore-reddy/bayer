variable "public_routes" {
  default = [
    {
      cidr_block = "0.0.0.0/0"
      gateway_type = "igw"
    }
  ]
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.searchstay.id
  
  dynamic "route" {
    for_each = var.public_routes
    content {
      cidr_block = route.value.cidr_block
      gateway_id = aws_internet_gateway.igw.id
    }
  }
  
  tags = {
    Name = "searchstay-public-route-table"
  }
}

# Route table associations are ALWAYS separate resources
resource "aws_route_table_association" "public" {
  for_each = aws_subnet.public
  
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}