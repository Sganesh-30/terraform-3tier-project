resource "aws_instance" "web" {
  ami           = "ami-057752b3f1d6c4d6c"
  instance_type = "t2.micro"
  key_name = "project-key-1"
  subnet_id = aws_subnet.public[count.index].id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  associate_public_ip_address = true
  count = 2
  }
resource "aws_key_pair" "project-key" {
  key_name = "project-key-1"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCuSwxdwyz7T6jdKyu5y5qTqSQEtPPLyAUUt7ORSmZu88p8Mmp994CXSUorgchQxmTcdCh0o0OqDWRajmClEx4SU5LZxM4h1QY8rKyHY8ikf8ORnjkwloGwcM0udAzK0Vby/LZ9x4hXVIL8GO73G9ep6lG6XQmfEljt4W4dPyibv5b71OgdYgh2AcrtL37DCn7OQgkbQ09oyhymu4L0gr0doIK8kf87oZb90+WfJRzsml+DAftKaW/2JvkhPkUTwJduPu4iogS+vV0fddjt4DMxsXL6rACTbZ8fc1Oo0wXDMJKZImzALWYFIEGw6pIkV0M+K6u4fk4ExMufj9Bmqo/x ec2-user@ip-172-31-37-216.ap-south-1.compute.internal"
}



resource "aws_instance" "db" {
  ami           = "ami-057752b3f1d6c4d6c"
  instance_type = "t2.micro"
  key_name = "project-key-1"
  subnet_id = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.allow_tls_db.id]

  tags = {
    Name = "DB Server"
  }
}
