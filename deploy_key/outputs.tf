output "private_key" {
  value     = tls_private_key.deploy_key.private_key_pem
  sensitive = true
}
