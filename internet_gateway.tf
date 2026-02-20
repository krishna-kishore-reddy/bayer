resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.searchstay.id
    tags = {
        Name = "searchstay-igw"
    }
}