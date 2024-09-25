variable "kvname" {
  description = "Name of the Key Vault that stores secrets and credentials."
  type        = string
}

variable "location" {
  description = "Azure region where the resources will be deployed."
  type        = string
  default     = "westeurope"
}

variable "rgname" {
  description = "Name of the resource group where all resources will be deployed."
  type        = string
}

variable "sa_accesskey_name" {
  description = "Name of the secret for storing the Storage Account access key in Key Vault."
  type        = string
}

variable "sa_id" {
  description = "The access key value for the Storage Account."
  type        = string
}

variable "vmcredentials" {
  description = "Name of the secret in Key Vault for storing VM credentials (username and password)."
  type        = string
}

variable "vm_username" {
  description = "The admin username for the Virtual Machine."
  type        = string
}
