resource "vault_mount" "mount" {
  path        = "hcp"
  type        = "kv"
  options     = { 
    version = "2" 
    }
  description = "HCP Secrets"
}