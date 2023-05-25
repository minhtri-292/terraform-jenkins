data "aws_ami" "linux" {
  most_recent=true
  filter {
    name = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.20230418.0-x86_64-gp2"]
  }
}

resource "aws_instance" "hello" {
  count         = 1
  ami           = data.aws_ami.linux.id
  instance_type = var.instance_type
  tags = {
    Name = "HelloWorld"
  }
}

output "ec2" {
  value = {
    #public_ip = aws_instance.hello.public_ip
    #public_ip = [for v in aws_instance.hello : v.public_ip]
    for i, v in aws_instance.hello : format("public_ip%d", i+1) => v.public_ip
  }
}