resource "aws_subnet" "public" {
  for_each = var.public_subnets
  vpc_id     = aws_vpc.searchstay.id
  cidr_block = each.value
  availability_zone = substr(each.key, 0, 11)
  map_public_ip_on_launch = true

  tags = {
    Name = "${each.key}-subnet"
  }
}

resource "aws_subnet" "private" {
  for_each = var.private_subnets
  vpc_id     = aws_vpc.searchstay.id
  cidr_block = each.value
  availability_zone = substr(each.key, 0, 11)

  tags = {
    Name = "${each.key}-subnet"
  }
}

