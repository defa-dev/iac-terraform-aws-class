# terraform console
locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}
variable "region" {
  default = "us-east-1"
}
variable "tags" {
  type = list
  default = ["firstec2","secondec2"]
}
variable "ami" {
  type = map
  default = {
    us-east-1 = "ami-04902260ca3d33422"
    "sa-east-1" = "ami-02edf5731752693cc"
  }
}
resource "aws_key_pair" "loginkey" {
  key_name   = "login-key"
  public_key = file("${path.module}/id_rsa.pub")
}
resource "aws_instance" "app-dev" {
   ami = lookup(var.ami,var.region)
   instance_type = "t2.micro"
   key_name = aws_key_pair.loginkey.key_name
   count = 2
   tags = {
     Name = element(var.tags,count.index)
   }
}
output "timestamp" {
  value = local.time
}