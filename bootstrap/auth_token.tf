resource "vault_token" "token" {
  display_name = "tf-service-account"
  policies = ["hcp-root"]
  renewable = true
  ttl = "500h"
  metadata = {
    "purpose" = "tf-service-account"
    "local" = "terraform"
  }
}