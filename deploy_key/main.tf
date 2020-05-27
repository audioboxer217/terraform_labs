provider "github" {
  individual = "true"
}
resource "tls_private_key" "deploy_key" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}

resource "local_file" "private_key" {
  content  = tls_private_key.deploy_key.private_key_pem
  filename = "${path.root}/generated_keys/${var.name}_deploy_key.pem"
}

resource "github_repository_deploy_key" "repo_deploy_key" {
  title      = "${var.env_name}_terraform_deploy_key"
  repository = var.repo_name
  key        = tls_private_key.deploy_key.public_key_openssh
  read_only  = var.read_only
}
