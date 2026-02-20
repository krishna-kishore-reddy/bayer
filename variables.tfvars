security_group_ingress = [20, 21 , 22, 80, 443, 3389, 3306, 5432, 6379, 8080, 9090, 9000, 9001, 25, 587, 143, 993, 110, 995]

security_group_egress = [-1]

route_table_routes = {
    public = "0.0.0.0/0"
    private = "0.0.0.0/0"
}

availability_zone = ["ap-south-2a", "ap-south-2b", "ap-south-2c"]

