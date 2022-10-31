### This could be a list that's iterated over. For each user..
data "tfe_organization_membership" "burkey" {
  organization  = var.tfe_organization
  email = "burkey@hashicorp.com"
}
data "tfe_organization_membership" "go" {
  organization  = var.tfe_organization
  email = "go@hashicorp.com"
}

resource "vault_terraform_cloud_secret_backend" "test" {
  backend     = "terraform"
  description = "TFC Backend"
  token       = var.tfe_token
}

resource "vault_terraform_cloud_secret_role" "example" {
  backend      = vault_terraform_cloud_secret_backend.test.backend
  name         = "vsphere_read"
  organization = "burkey"
  team_id      = tfe_team.vsphere_read.team_id
  depends_on = [
    tfe_team.vsphere_read
  ]
}

## Creates Group
resource "tfe_team" "vsphere_read" {
  name = "vsphere_read"
  organization = var.tfe_organization
  sso_team_id = "INSERT_TEAM_ID"
}

## Assign Users to Group

resource "tfe_team_organization_member" "burkey" {
  team_id = tfe_team.vsphere_read
  organization_membership_id = data.tfe_organization_membership.burkey.id
}

resource "tfe_team_organization_member" "go" {
  team_id = tfe_team.vsphere_read
  organization_membership_id = data.tfe_organization_membership.go.id
}




