variable "kvname" {
  description = "Name of the Key Vault."
  type        = string
}

variable "location" {
  description = "Location for the Key Vault."
  type        = string
  default = "westeurope"
}

variable "rgname" {
  description = "Resource Group for the Key Vault."
  type        = string
}

variable "sa_accesskey_name" {
  description = "Name of the secret for the Storage Account Access Key."
  type        = string
}

variable "sa_id" {
  description = "The access key value for the Storage Account."
  type        = string
}

variable "vmcredentials" {
  description = "Name of the secret for VM credentials (username and password)."
  type        = string
}

variable "vm_username" {
  description = "The username for the VM."
  type        = string
}
