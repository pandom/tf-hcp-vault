resource "vault_token" "token" {
  display_name = "tf-service-account"
  policies = ["hcp-root"]
  role_name = "hcp-root"
  renewable = true
  ttl = "500h"
  no_default_policy = true
  metadata = {
    "purpose" = "tf-service-account"
    "local" = "terraform"
  }
}