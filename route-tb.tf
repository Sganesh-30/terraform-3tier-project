resource "aws_route_table" "rtb" {
    vpc_id = aws_vpc.main.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gw.id
    }

    tags = {
        Name = "MyRoute"
    }
}

resource "aws_route-table_associataion" "a" {
    subnet_id       = aws_subnet.public[count.index].id
    route_table_id  = aws_route_table.rtb.id
    count = 2
}

resource "aws_default_route_table" "dfltrb" {
    default_route_table_id = aws_vpc.main.default_route_table_id

     route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.natgw.id
    }

    tags = {
        Name = "dfltrb"
    }
}