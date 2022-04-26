variable "sg_ports" {
  type        = list(number)
  description = "Lista com as portas para o SG"
  default     = [8200, 8201, 8300, 9200, 9500]
}

resource "aws_security_group" "allow_ports_dynamic" {
  name        = "exemplo-sg-dynamic"
  description = "SG Exemplo Dinamico"
  vpc_id      = data.aws_vpc.vpc_default.id

  dynamic "ingress" {
    for_each = var.sg_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  dynamic "egress" {
    for_each = var.sg_ports
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}