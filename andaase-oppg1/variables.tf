variable "subscription_id" {
  type        = string
  description = "The subscription ID where the resources will be created."
  sensitive   = true
}

variable "rg_name" {
  type        = string
  description = "Name of the resource group where all resources will be deployed."
}

variable "location" {
  description = "Azure region where the resources will be deployed."
  type        = string
  default     = "westeurope"
}


#Keyvault stuff

variable "kvname" {
  description = "Name of the Key Vault that stores secrets and credentials."
  type        = string
}

variable "sa_accesskey_name" {
  description = "Name of the secret for storing the Storage Account access key in Key Vault."
  type        = string
}

variable "vmcredentials" {
  description = "Name of the secret in Key Vault for storing VM credentials (username and password)."
  type        = string
}

variable "vm_username" {
  description = "The admin username for the Virtual Machine Scale Set (VMSS)."
  type        = string
}

# Network stuff

variable "vnetname" {
  type        = string
  description = "Name of the Virtual Network (VNet) where the subnet is located."
}

variable "subnetname" {
  type        = string
  description = "Name of the subnet within the Virtual Network (VNet)."
}

variable "nsgname" {
  type        = string
  description = "Name of the Network Security Group (NSG) that controls traffic to the VM."
}

variable "public_ip_name" {
  description = "Name of the public IP address associated with the VMSS."
  type        = string
}

variable "nicipname" {
  type        = string
  description = "Name of the IP configuration for the Network Interface Card (NIC)."
}

variable "nicname" {
  type        = string
  description = "Name of the Network Interface Card (NIC) associated with the VM."
}

# Storage account stuff

variable "sa_name" {
  type        = string
  description = "Name of the Storage Account to be created."
}

variable "sc_name" {
  type        = string
  description = "Name of the Storage Container inside the Storage Account."
}

# VM Stuff

variable "vmname" {
  type        = string
  description = "Name of the Virtual Machine instance."
}

variable "vmpublisher" {
  type        = string
  description = "Publisher of the VM image, typically used to define the image source."
  default     = "Canonical"
}

variable "vmoffer" {
  type        = string
  description = "Offer of the VM image, used to specify the type of VM (e.g., Ubuntu server)."
  default     = "0001-com-ubuntu-server-jammy"
}

variable "vmsku" {
  type        = string
  description = "SKU of the VM image, typically specifies the version of the image."
  default     = "22_04-lts"
}

variable "vmversion" {
  type        = string
  description = "Version of the VM image to deploy, often set to 'latest' for the most recent release."
  default     = "latest"
}
