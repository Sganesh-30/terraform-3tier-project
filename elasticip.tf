resource "aws-eip" "myeip"{
    //instance = aws_instance.web.id
    vpc        = true
}