resource "aws_instance" "web" {
    ami           = ""
    instance_type =
    key_name      =
    subnet_id     = aws_subnet.public[count.index].id
    vpc_security-group = [aws_security_group.allow_tls.id]
    associate_public_ip_address = true
    count = 2

    tags = {
        Name = WebServer1"
    }

    provisioner "file" {
        source= ""
        destination = ""

        connection {
            type = "ssh"
            host = self.public.ip
            user = "ec2-user"
            private_key = ""
        }
    }
}

resource "aws_instance" "web" {
    ami           = ""
    instance_type =
    key_name      =
    subnet_id     = aws_subnet.public[count.index].id
    vpc_security-group = [aws_security_group.allow_tls.id]

    tags = {
        Name = "DB Server"
    }
}