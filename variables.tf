variable "tfe_organization" {
    default = "burkey"
    type = string
    description = "Organisation in Terraform Cloud"  
}

variable "tfe_token" {
    type = "string"
    description = "Token"
}