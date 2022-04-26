variable "times" {
  type        = list(string)
  default     = ["Corinthians", "Palmeiras", "Santos", "São Paulo"]
  description = "Times paulistas"
}

output "times_paulistas" {
  value       = var.times
  description = "Times paulistas da Série A."
}
