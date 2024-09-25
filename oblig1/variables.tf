variable "subscription_id" {
  type        = string
  description = "(optional) describe your variable"
  sensitive   = true
}


variable "rg_name" {
  type        = string
  description = "(optional) describe your variable"
}

variable "sa_name" {
  type        = string
  description = "(optional) describe your variable"
}

variable "kvname" {
  description = "Name of the Key Vault."
  type        = string
}

variable "location" {
  description = "Location for the resource group"
  type        = string
  default     = "westeurope"
}

variable "sa_accesskey_name" {
  description = "Name of the secret for the Storage Account Access Key."
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

variable "sc_name" {
  type        = string
  description = "(optional) describe your variable"
}

variable "subnetname" {
    type = string
    description = "(optional) describe your variable"
}

variable "public_ip_name" {
  description = "Name of the public IP."
  type        = string
}
variable "nsgname" {
  type        = string
  description = "Network security group default"
}

variable "vnetname" {
  type        = string
  description = "Virtual network name"
}