resource "tls_private_key" "deploy_key" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}

resource "local_file" "private_key" {
  content  = tls_private_key.deploy_key.private_key_pem
  filename = "${path.root}/generated_keys/${var.name}_deploy_key.pem"
}

resource "local_file" "public_key" {
  content  = tls_private_key.deploy_key.public_key_openssh
  filename = "${path.root}/generated_keys/${var.name}_deploy_key.pub"
}
