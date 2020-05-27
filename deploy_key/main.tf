provider "github" {
  organization = "codaglobal" 
}
resource "tls_private_key" "deploy_key" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}

resource "github_repository_deploy_key" "repo_deploy_key" {
  title      = "${var.env_name}_terraform_deploy_key"
  repository = var.repo_name
  key        = tls_private_key.deploy_key.public_key_openssh
  read_only  = var.read_only
}
