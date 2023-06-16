resource "aws_security_group" "allows_tls" {
    name        = "allo_tls"
    description = "Allow TLS inbound traffic"
    vpc_id      = aws_vpc.main.id

    ingress {
        description = "TLS from VPC"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "TLS from VPC"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        form_port  = 0
        to_port    = 0
        protocol   = "-1"
        cidr_block = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow_tls"
    }
}

resource "aws_security_group_grou" "allow-tls_db" {
    name        = "allow_tls_db"
    description = "Allow TLS inbound traffic"
    vpc_id      = aws_vpc.main.id

     ingress {
        description = "TLS from VPC"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "TLS from VPC"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        form_port  = 0
        to_port    = 0
        protocol   = "-1"
        cidr_block = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow_tls_db"
    }
}
    