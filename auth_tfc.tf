### This could be a list that's iterated over. For each user..
data "tfe_organization_membership" "burkey" {
  organization  = var.shared_tfe_organization
  #organization  = var.tfe_organization
  email = "burkey@hashicorp.com"
}
data "tfe_organization_membership" "go" {
organization  = var.shared_tfe_organization
  #organization  = var.tfe_organization
  email = "go@hashicorp.com"
}
## Create Backend
resource "vault_terraform_cloud_secret_backend" "tfc" {
  backend     = "terraform"
  description = "TFC Backend"
  token       = var.tfe_token
}

## Creates Team
resource "tfe_team" "vsphere_read" {
  name = "vsphere_read"
  organization  = var.shared_tfe_organization
  #organization = var.tfe_organization
}

## Create Role
resource "vault_terraform_cloud_secret_role" "example" {
  backend      = vault_terraform_cloud_secret_backend.tfc.backend
  name         = "vsphere_read"
  organization  = var.shared_tfe_organization
  #organization = var.tfe_organization
  team_id      = tfe_team.vsphere_read.id
  depends_on = [
    tfe_team.vsphere_read
  ]
}

## Map Role and Policy



# resource "tfe_team" "vsphere_write" {
#   name = "vsphere_read"
#   organization  = var.shared_tfe_organization
#   #organization = var.tfe_organization
#   sso_team_id = "INSERT_TEAM_ID"
# }

## Assign Users to Group

resource "tfe_team_organization_member" "burkey" {
  team_id = tfe_team.vsphere_read.id
  organization_membership_id = data.tfe_organization_membership.burkey.id
}

resource "tfe_team_organization_member" "go" {
  team_id = tfe_team.vsphere_read.id
  organization_membership_id = data.tfe_organization_membership.go.id
}




