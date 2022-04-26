variable "pais" {
    type = string
    # default = "Argentina"
    description = "Informe o seu país"
}

output "seu_pais" {
  value = var.pais  
}

output "meu_check" {
  value = var.check
}