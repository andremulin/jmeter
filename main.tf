provider "aws" {
  region = "us-east-1"
  profile = "dev"
}

resource "aws_instance" "master" {
    ami = var.amis["us-east-1"]
    instance_type = "t3.small"
    key_name = var.key_name
    subnet_id = var.subnets.a
    vpc_security_group_ids = var.security_groups
    tags = {
        Name = "ing-dev-ec2-jmeter-master"
        jmeter = "master"
    }

    # provisioner "remote-exec" {
    #   inline = ["echo 'Wait until SSH is ready'"]

    #   connection {
    #     type  = "ssh"
    #     user  = "ubuntu"
    #     private_key = file("./ING-DEV-ITOPS")
    #     host = aws_instance.master.private_ip
    #   }
    # }

    # provisioner "local-exec" {
    #   command = "ansible-playbook -i ${aws_instance.master.private_ip}, jmeter_master.yml"
    # }
}

#resource "aws_instance" "server" {
#    count = 3
#    ami = var.amis["us-east-1"]
#    instance_type = "t3.small"
#    key_name = var.key_name
#    subnet_id = var.subnets.a
#    vpc_security_group_ids = var.security_groups
#    tags = {
#        Name = "ing-dev-ec2-jmeter-server-${count.index}"
#        jmeter = "server"
#    }
#}
