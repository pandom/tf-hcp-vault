terraform {
    # cloud {
    # organization = "burkey"
    # workspaces {
    #   name = "tf-hcp-vault"
    # }
  }
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "3.8.2"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.3.2"
    }
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.36.1"
    }

  }
provider "vault" {
  #remove variables.
}
provider "random" {}
provider "tfe" {}


