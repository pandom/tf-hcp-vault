terraform {
  cloud {
    organization = "burkey"
    workspaces {
      name = "tf-hcp-vault-bootstrap"
    }
  }

  required_providers {
    vault = {
        source = "hashicorp/vault"
        version = "3.8.2"
    }
    tfe = {
        source = "hashicorp/tfe"
        version = "0.36.1"
    }
    random = {
        source = "hashicorp/random"
        version = "3.3.2"
    }
    hcp = {
      source = "hashicorp/hcp"
      version = "0.42.0"
    }
  }
}

provider "vault" {
    namespace = var.vault_namespace
    address = var.vault_addr

}
provider "random" {}
provider "tfe" {}
provider "hcp" {
  client_id = var.hcp_client_id
  client_secret = var.hcp_client_secret
}
