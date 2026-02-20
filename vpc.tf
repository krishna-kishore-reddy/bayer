resource "aws_vpc" "searchstay" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "searchstay-vpc"
  }
}