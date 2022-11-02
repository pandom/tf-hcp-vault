
resource "tfe_organization_membership" "burkey" {
  organization = var.tfe_organization
  username = "burkey"
}
# data "tfe_organization_membership" "go" {
#   organization = data.tfe_organization.org.name
#   #email = "go@hashicorp.com"
#   username = "go"
# }

# resource "vault_terraform_cloud_secret_backend" "test" {
#   backend     = "terraform"
#   description = "TFC Backend"
#   token       = var.tfe_token
# }

# resource "vault_terraform_cloud_secret_role" "example" {
#   backend      = vault_terraform_cloud_secret_backend.test.backend
#   name         = "vsphere_read"
#   organization = data.tfe_organization.org.name
#   team_id      = tfe_team.vsphere_read.id
#   depends_on = [
#     tfe_team.vsphere_read
#   ]
# }

## Creates Group
resource "tfe_team" "vsphere_read" {
  name         = "vsphere_read"
  organization = var.tfe_organization
  sso_team_id  = "INSERT_TEAM_ID"
}

# ## Assign Users to Group

# resource "tfe_team_organization_member" "burkey" {
#   team_id                    = tfe_team.vsphere_read.id
#   organization_membership_id = data.tfe_organization_membership.burkey.id
# }

# resource "tfe_team_organization_member" "go" {
#   team_id                    = tfe_team.vsphere_read.id
#   organization_membership_id = data.tfe_organization_membership.go.id
# }
