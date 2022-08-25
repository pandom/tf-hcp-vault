variable "hcp_client_id" {
    description = "hcp-client-id"
    type = string
    default = "client-burkey"
}

variable "hcp_client_secret" {
    description = "secret"
    type = string
    default = ""
}

variable "vault_addr" {
    description = "HCP VAULT public address"
    type = string
    default = "https://vault-plus-public-vault-8c8c1dfb.4ad44770.z1.hashicorp.cloud:8200"
  
}

variable "vault_namespace" {
    description = "HCP VAULT namespace"
    type = string
    default = "admin"
  
}
