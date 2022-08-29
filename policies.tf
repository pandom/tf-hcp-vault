# Read on HCP API kv
resource "vault_policy" "hcp_kv_read" {
    name = "hcp_read"
    policy = file("./policy/hcp_kv_read.hcl")
  
}