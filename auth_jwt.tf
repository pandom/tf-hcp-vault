# resource "vault_jwt_auth_backend" "github" {
#     description         = "Github JWT auth backend"
#     path                = "jwt"
#     oidc_discovery_url  = "https://myco.auth0.com/"
#     bound_issuer        = "https://myco.auth0.com/"
# }

### This requires a key-value mounted to secret/data/