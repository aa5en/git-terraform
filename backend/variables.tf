variable "rg_backend_name" {
    type = string
    description = "(optional) describe your variable"
    default = "rg-tf-backend-001"
}
variable "rg_backend_location" {
    type = string
    description = "(optional) describe your variable"
    default = "westeurope"
}
variable "sa_backend_name" {
    type = string
    description = "(optional) describe your variable"
    default = "aasabackend001"
}

variable "sc_backend_name" {
    type = string
    description = "(optional) describe your variable"
    default = "sc-tf-backend-001"
}
variable "kv_backend_name" {
    type = string
    description = "(optional) describe your variable"
}

variable "sa_backend_accesskey_name" {
    type = string
    description = "(optional) describe your variable"
}
variable "subscription_id" {
    type = string
    description = "(optional) describe your variable"
}