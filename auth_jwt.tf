resource "vault_jwt_auth_backend" "github" {
  description        = "Github JWT auth backend"
  path               = "gh-actions"
  oidc_discovery_url = "https://token.actions.githubusercontent.com"
  bound_issuer       = "https://token.actions.githubusercontent.com"
}


### This requires a key-value mounted to secret/data/
## Source: https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-hashicorp-vault
resource "vault_jwt_auth_backend_role" "jwt_hcp_role" {
  backend         = vault_jwt_auth_backend.github.path
  role_name       = "packer-action"
  bound_audiences = ["https://github.com/pandom"]
  bound_claims = {
    "repository" = "pandom/gha-vault-jwt"
    "ref"        = "refs/heads/main"
  }
  user_claim = "actor"
  role_type  = "jwt"
  token_ttl  = "3600"
  token_policies = [
  vault_policy.hcp_kv_read.name, "default"]
}