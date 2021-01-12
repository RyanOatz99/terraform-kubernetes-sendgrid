output "hostname" {
  description = "Hostname of the smtp server"
  value       = "smtp.sendgrid.net"
}

output "port" {
  description = "Port SMTP server is listening on"
  value       = "587"
}

output "username" {
  description = "Username of SMTP account"
  value       = "apikey"
}

output "secret_name" {
  description = "Secret name that contains the SMTP password"
  value       = var.create_secret ? kubernetes_secret.sendgrid[0].metadata[0].name : ""
}

output "secret_key" {
  description = "Secret key that contains the SMTP password"
  value       = var.create_secret ? var.secret_key : ""
}

output "password" {
  description = "Password for the SMTP account"
  value       = sendgrid_api_key.sendgrid.api_key
}
