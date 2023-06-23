resource "aws_instance" "web" {
  ami           = "ami-022e1a32d3f742bd8"
  instance_type = "t2.micro"
  key_name = "TF_key"
  subnet_id = aws_subnet.public[count.index].id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  associate_public_ip_address = true
  count = 2
  }
resource "aws_key_pair" "TF_key" {
  key_name = "TF_key"
  public_key = tls_private_key.rsa.public_key_openshh
}

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_instance" "db" {
  ami           = "ami-022e1a32d3f742bd8"
  instance_type = "t2.micro"
  key_name = "TF_key"
  subnet_id = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.allow_tls_db.id]

  tags = {
    Name = "DB Server"
  }
}
