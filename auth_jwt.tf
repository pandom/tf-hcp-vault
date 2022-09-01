resource "vault_jwt_auth_backend" "github" {
    description         = "Github JWT auth backend"
    path                = "gha"
    oidc_discovery_url  = "https://token.actions.githubusercontent.com"
    bound_issuer        = "https://token.actions.githubusercontent.com"
    default_role = "packer-action"
}

### This requires a key-value mounted to secret/data/
## Source: https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-hashicorp-vault
resource "vault_jwt_auth_backend_role" "jwt_hcp_role" {
    backend = vault_jwt_auth_backend.github.path
    role_name = "packer-action"
    bound_claims = { 
        "repositories" = "pandom/packer-ubuntu"
        "ref"        = "refs/heads/main"
    }
    bound_audiences = ["sigstore"]
    role_type = "jwt"
    user_claim = "actor" 
    token_ttl = "3600"
    token_policies = [
        vault_policy.hcp_kv_read.name]
}