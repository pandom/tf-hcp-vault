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

resource "hcp_vault_cluster_admin_token" "token" {
     cluster_id = "vault-plus"
}