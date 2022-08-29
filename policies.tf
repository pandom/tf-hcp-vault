# Read on HCP API kv
resource "vault_policy" "hcp_kv_read" {
    name = "hcp-kv-read"
    policy = file("./policy/hcp_kv_read.hcl")
  
}