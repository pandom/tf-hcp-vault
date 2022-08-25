terraform {
  required_providers {
    vault = {
        source = "hashicorp/vault"
        version = "3.8.2"
    }
    tfe = {
      source = "hashicorp/tfe"
      version = "0.36.1"
    }
  }
}

provider "vault" {
    namespace = "admin"
}

provider "tfe" {}

provider "hcp" {
    client_id = var.hcp_client_id
    client_secret =  var.hcp_client_secret
}