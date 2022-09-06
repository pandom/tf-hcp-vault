resource "vault_jwt_auth_backend" "github" {
  description        = "Github JWT auth backend"
  oidc_discovery_url = "https://token.actions.githubusercontent.com"
  bound_issuer       = "https://token.actions.githubusercontent.com"
  default_role = "gha"
  tune = [ {
    allowed_response_headers = [ "value" ]
    audit_non_hmac_response_keys = [ "error", "namespace" ]
    audit_non_hmac_request_keys = [ "error", "namespace" ]
    default_lease_ttl = "1h"
    listing_visibility = "hidden"
    max_lease_ttl = "1h"
    passthrough_request_headers = [ "" ]
    token_type = "default-service"
  } ]
}


### This requires a key-value mounted to secret/data/
## Source: https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-hashicorp-vault
resource "vault_jwt_auth_backend_role" "jwt_hcp_role" {
  backend         = vault_jwt_auth_backend.github.path
  role_name       = "gha"
  bound_audiences = ["https://github.com/pandom"]
  bound_claims = {
    "repository" = "pandom/gha-vault-jwt"
    "ref"        = "refs/*"
  }
  bound_claims_type = "glob"
  user_claim = "workflow"
  role_type  = "jwt"
  token_ttl  = "3600"
  token_policies = [
  vault_policy.hcp_kv_read.name, "default"]
  verbose_oidc_logging = true
}