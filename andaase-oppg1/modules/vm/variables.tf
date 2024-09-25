variable "rgname" {
  type        = string
  description = "Name of the resource group where all resources will be deployed."
}

variable "location" {
  type        = string
  description = "Azure region where the resources will be deployed."
  default     = "westeurope"
}

variable "subnet_id" {
  type        = string
  description = "ID of the subnet within the Virtual Network (VNet) where the VM is connected."
}

variable "vmname" {
  type        = string
  description = "Name of the Virtual Machine instance."
}

variable "username" {
  type        = string
  description = "Admin username for the Virtual Machine."
}

variable "password" {
  type        = string
  description = "Admin password for the Virtual Machine."
}

variable "nicname" {
  type        = string
  description = "Name of the Network Interface Card (NIC) associated with the VM."
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

variable "nicipname" {
  type        = string
  description = "Name of the IP configuration for the Network Interface Card (NIC)."
}

variable "public_ip_id" {
  type        = string
  description = "ID of the public IP address associated with the VM."
}

variable "vmsize" {
  type        = string
  description = "Size of the Virtual Machine, defining the VM's CPU, memory, and other resources."
  default     = "Standard_F2"
}

variable "nsg_id" {
  type        = string
  description = "ID of the Network Security Group (NSG) associated with the VM."
}
