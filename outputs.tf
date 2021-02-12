output "master" {
    value = aws_instance.master.private_ip
}

output "servers" {
   value = [aws_instance.server.*.private_ip]
}
