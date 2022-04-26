resource "aws_instance" "web" {
  ami           = "ami-04902260ca3d33422"
  instance_type = "t3.medium"
  tags = {
    Name = "Remote-Exec Instance"
  }
  provisioner "local-exec" {
    command = "echo ${aws_instance.web.private_ip} >> private_ips.txt"
  }
}