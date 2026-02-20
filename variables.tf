variable "public_subnets" {
  default = {
    ap-south-2a-public = "10.0.1.0/24"
    ap-south-2b-public = "10.0.3.0/24"
    ap-south-2c-public = "10.0.5.0/24"
  }
}

variable "private_subnets" {
  default = {
    ap-south-2a-private = "10.0.2.0/24"
    ap-south-2b-private = "10.0.4.0/24"
    ap-south-2c-private = "10.0.6.0/24"
  }
}

variable "security_group_ingress" {
  default = [20, 21, 22, 80, 443, 3389, 3306, 5432, 6379, 8080, 9090, 9000, 9001, 25, 587, 143, 993, 110, 995]
}

variable "security_group_egress" {
  default = [-1]
}

variable "availability_zone" {
  default = ["ap-south-2a"]
  type = list(string)
}