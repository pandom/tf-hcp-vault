resource "vault_jwt_auth_backend" "github" {
    description         = "Github JWT auth backend"
    path                = "jwt"
    oidc_discovery_url  = "https://token.actions.githubusercontent.com"
    bound_issuer        = "https://token.actions.githubusercontent.com"
}

### This requires a key-value mounted to secret/data/

resource "vault_jwt_auth_backend_role" "jwt_hcp_role" {
    role_name = "packer-action"
    bound_claims = {
    "repositories" = "pandom/packer-ubuntu"
  }
    role_type = "jwt"
    user_claim = "actor" 
    token_ttl = "60m"
    token_policies = [
        vault_policy.hcp_kv_read.name]
}