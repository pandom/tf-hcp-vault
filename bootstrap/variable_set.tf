data "tfe_organization" "burkey" {
    name = "burkey"
}

resource "tfe_variable_set" "vault" {
  name          = "HCP Vault Credentials"
  description   = "Created locally via CLI"
  organization  = data.tfe_organization.burkey.name
  global        = true
}

resource "tfe_variable" "vault_token" {
  key             = "VAULT_TOKEN"
  value           = vault_token.token.client_token
  category        = "env"
  sensitive       = true
  description     = "Vault Token"
  variable_set_id = tfe_variable_set.vault.id
}

resource "tfe_variable" "vault_address" {
  key             = "VAULT_ADDR"
  value           = var.vault_addr
  category        = "env"
  sensitive       = false
  description     = "Vault Token"
  variable_set_id = tfe_variable_set.vault.id
}

resource "tfe_variable" "vault_namespace" {
  key             = "VAULT_ADDR"
  value           = var.vault_namespace
  category        = "env"
  sensitive       = false
  description     = "Vault namespace"
  variable_set_id = tfe_variable_set.vault.id
}