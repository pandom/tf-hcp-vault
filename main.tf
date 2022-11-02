terraform {
  # cloud {
  # organization = "burkey"
  # workspaces {
  #   name = "tf-hcp-vault"
  # }

  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "3.10.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.3.2"
    }
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.38.0"
    }

  }
}
provider "vault" {
  #remove variables.
}
provider "random" {}
provider "tfe" {}

