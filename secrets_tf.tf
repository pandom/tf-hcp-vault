
# data "tfe_organization" "burkey" {
#   name = "burkey"
# }
# ## Creates a random value

# resource "random_pet" "var_set" {
#   length    = 3
#   separator = "-"
# }
# # # This creates the team in terraform cloud
# resource "tfe_team" "team" {
#   name         = "vault-${random_pet.var_set.id}"
#   organization = data.tfe_organization.burkey.name
# }

# ## Creating the Vault Backend
# resource "vault_terraform_cloud_secret_backend" "tfc" {
#   backend = "tfc"
#   token   = var.tfe_token
# }

# resource "vault_terraform_cloud_secret_role" "this" {
#   backend = vault_terraform_cloud_secret_backend.tfc.backend
#   name    = tfe_team.team.name
#   team_id = tfe_team.team.id
#   ttl     = 300
#   max_ttl = 900
# }

# resource "vault_policy" "tfc" {
#   name = tfe_team.team.name

#   policy = <<EOH
# path "${tfe_team.team.id}" {
# 	capabilities = ["read"]
# }
# EOH

# }