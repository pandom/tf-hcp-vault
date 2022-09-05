## This is referenced via JWT auth

## HCP Credential KV
path "hcp/data/creds" {
    capabilities = ["read"]
}
## AWS Credential KV
path "aws/data/creds" {
    capabilities = ["read"]
}
## Google Credential KV
path "gcp/data/creds" {
    capabilities = ["read"]
}