provider "aws" {
  region = "us-east-1"
  profile = "default"
}

resource "aws_instance" "master" {
    ami = var.ami
    instance_type = "t3.small"
    key_name = var.key_name
    subnet_id = var.subnets.a
    vpc_security_group_ids = var.security_groups
    tags = {
        Name = "ing-dev-ec2-jmeter-master"
        jmeter = "master"
    }
}

resource "aws_instance" "server" {
   count = 3
   ami = var.ami
   instance_type = "t3.small"
   key_name = var.key_name
   subnet_id = var.subnets.a
   vpc_security_group_ids = var.security_groups
   tags = {
       Name = "ing-dev-ec2-jmeter-server-${count.index}"
       jmeter = "server"
   }
}
