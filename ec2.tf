resource "aws_instance" "web" {
    ami           = "ami-022e1a32d3f742bd8"
    instance_type = "t2.micro"
    key_name      = "project-1"
    subnet_id     = aws_subnet.public[count.index].id
    vpc_security-group = [aws_security_group.allow_tls.id]
    associate_public_ip_address = true
    count = 2

    tags = {
        Name = WebServer1"
    }

    provisioner "file" {
        source= "./project-1"
        destination = "/home/ec3-user/project-1"

        connection {
            type = "ssh"
            host = self.public.ip
            user = "ec2-user"
            private_key = "${file("./project-1")}
        }
    }
}

resource "aws_instance" "web" {
    ami           = "ami-022e1a32d3f742bd8"
    instance_type = "t2.micro"
    key_name      = "project-1"
    subnet_id     = aws_subnet.public[count.index].id
    vpc_security-group = [aws_security_group.allow_tls.id]

    tags = {
        Name = "DB Server"
    }
}
