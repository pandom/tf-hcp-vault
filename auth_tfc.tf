# ### This could be a list that's iterated over. For each user..
data "tfe_organization_membership" "burkey" {
  organization  = var.tfe_organization
  #organization  = var.tfe_organization
  email = "burkey@hashicorp.com"
}
data "tfe_organization_membership" "go" {
organization  = var.tfe_organization
  #organization  = var.tfe_organization
  email = "go@hashicorp.com"
}
# ## Create Backend
# resource "vault_terraform_cloud_secret_backend" "tfc_backend" {
#   backend     = "terraform"
#   description = "TFC Backend for ${var.tfe_organization}"
#   #token       = var.tfe_token
# }

## Creates Team
resource "tfe_team" "vsphere_read" {
  name = "vsphere_read"
  organization  = var.tfe_organization
}

resource "tfe_team_organization_member" "burkey" {
    team_id = tfe_team.vsphere_read.id
    tfe_team_organization_member = data.tfe_organization_membership.burkey.id
}

# ## Create Role
# # resource "vault_terraform_cloud_secret_role" "example" {
# #   backend      = vault_terraform_cloud_secret_backend.tfc_backend.backend
# #   name         = "vsphere_read"
# #   organization  = var.tfe_organization
# #   #organization = var.tfe_organization
# #   team_id      = tfe_team.vsphere_read.id
# #   depends_on = [
# #     tfe_team.vsphere_read
# #   ]
# #}

# ## Map Role and Policy
# ## Assign Users to Group

# resource "tfe_team_organization_members" "vsphere_read" {
#       team_id      = tfe_team.vsphere_read.id
#       organization_membership_ids = [
#         data.tfe_organization_membership.burkey.id,
#         data.tfe_organization_membership.go.id
#       ]
# }