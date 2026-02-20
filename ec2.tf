resource "aws_instance" "searchstay" {
    ami = "ami-0c2d3ff62b8071647"
    instance_type = "t3.micro"
    key_name = aws_key_pair.deployer.key_name
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    subnet_id = aws_subnet.public["ap-south-2a-public"].id
    associate_public_ip_address = true
    tags = {
        Name = "searchstay"
    }
}

resource "aws_instance" "searchstay-private" {
    ami = "ami-0c2d3ff62b8071647"
    instance_type = "t3.micro"
    key_name = aws_key_pair.deployer.key_name
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    subnet_id = aws_subnet.private["ap-south-2a-private"].id
    associate_public_ip_address = false
    tags = {
        Name = "searchstay"
    }
}