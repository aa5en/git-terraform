variable "nsgname" {
  type        = string
  description = "Name of the Network Security Group (NSG) that controls traffic to the VM."
}

variable "vnetname" {
  type        = string
  description = "Name of the Virtual Network (VNet) where the subnet is located."
}

variable "rgname" {
  type        = string
  description = "Name of the resource group where all resources will be deployed."
}

variable "location" {
  type        = string
  description = "Azure region where the resources will be deployed."
  default     = "westeurope"
}

variable "subnetname" {
  type        = string
  description = "Name of the subnet within the Virtual Network (VNet)."
}

variable "public_ip_name" {
  description = "Name of the public IP address associated with the VM."
  type        = string
}
