terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "kseppler"

    workspaces {
      prefix = "terraform_labs_"
    }
  }
}

module "test_deploy_key" {
  source = "./deploy_key"
  name   = "test"
}

