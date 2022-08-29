resource "vault_mount" "mount" {
  path        = "hcp"
  type        = "kv"
  options     = { 
    version = "2" 
    }
  description = "HCP Secrets"
}

# Seeding of HCP Vault credentials can be done via Obsidian bootstrap
# obsidian://open?vault=hive&file=Vault%2FVault%20Lab%20Bootstrap
# vault kv put hcp/creds hcp_client_id=$(echo $HCP_CLIENT_ID), hcp_client_secret=$(echo $HCP_CLIENT_SECRET)


